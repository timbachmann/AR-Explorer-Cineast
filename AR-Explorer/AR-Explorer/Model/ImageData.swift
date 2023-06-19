//
//  ImageData.swift
//  CapVis-AR
//
//  Created by Tim Bachmann on 10.02.22.
//

import Foundation
import Combine
import OpenAPIClient
import MapKit

/**
 Observable class image data to represent current images and images to upload.
 Contains functions to save and load data from the app's cache directory
 */
class ImageData: ObservableObject {
    @Published var explorerImages: [ApiImage] = []
    @Published var imagesToUpload: [ApiImage] = []
    @Published var capturedImage: Data = Data()
    @Published var localFilesSynced: Bool = true
    @Published var navigationImage: ApiImage? = nil
    @Published var radius: Double = 2.0
    @Published var startDate: Date = Date(timeIntervalSince1970: -3155673600.0)
    @Published var endDate: Date = Date(timeIntervalSinceNow: 0.0)
    @Published var queryText: String = ""
    @Published var includeDate: Bool = false
    @Published var includeRadius: Bool = false
    @Published var includeText: Bool = false
    @Published var includeExample: Bool = false
    @Published var queryLocation: CLLocationCoordinate2D? = nil
    
    /**
     Initialize images by loading from cache
     */
    init() {
        
        loadQuery { (data, error) in
            if let retrievedData = data {
                self.radius = retrievedData.radius
                self.startDate = retrievedData.startDate
                self.endDate = retrievedData.endDate
                self.queryText = retrievedData.queryText
                self.includeDate = retrievedData.includeDate
                self.includeRadius = retrievedData.includeRadius
                self.includeText = retrievedData.includeText
                self.includeExample = retrievedData.includeExample
                self.queryLocation = CLLocationCoordinate2D(latitude: retrievedData.lat, longitude: retrievedData.lng)
            }
        }
        
        loadQueryImage { (data, error) in
            if let retrievedData = data {
                self.capturedImage = retrievedData
            }
        }
        
        loadAllImages { (data, error) in
            if let retrievedData = data {
                self.explorerImages = retrievedData
                self.explorerImages.sort(by: { $0.date < $1.date })
            }
        }
        
        loadLocalImages { (data, error) in
            if let retrievedData = data {
                self.imagesToUpload = retrievedData
                self.localFilesSynced = self.imagesToUpload.isEmpty
            }
        }
    }
    
    /**
     Loads previously queried images from cache and returns list
     */
    func loadAllImages(completion: @escaping (_ data: [ApiImage]?, _ error: String?) -> ())  {
        var images: [ApiImage] = []
        var receivedError: String?
        
        DispatchQueue.global(qos: .background).async {
            let cachePath = self.getCacheDirectoryPath().appendingPathComponent("images")
            let fileManager: FileManager = FileManager.default
            
            
            do {
                let imageFolders: [URL] = try fileManager.contentsOfDirectory(at: cachePath, includingPropertiesForKeys: nil)
                
                for imageFolder in imageFolders {
                    var metaData: MetaData
                    let metaPath = imageFolder.appendingPathComponent("\(imageFolder.lastPathComponent).json")
                    
                    do {
                        let rawMetaData = try Data(contentsOf: metaPath)
                        let decoder = JSONDecoder()
                        metaData = try decoder.decode(MetaData.self, from: rawMetaData)
                        
                        var imageData: Data
                        let fullImagePath = imageFolder.appendingPathComponent("\(imageFolder.lastPathComponent).jpg")
                        
                        do {
                            imageData = try Data(contentsOf: fullImagePath)
                        } catch {
                            imageData = Data()
                        }
                        
                        var thumbData: Data
                        let thumbPath = imageFolder.appendingPathComponent("\(imageFolder.lastPathComponent)-thumb.jpg")
                        
                        do {
                            thumbData = try Data(contentsOf: thumbPath)
                        } catch {
                            thumbData = Data()
                        }
                        
                        images.append(ApiImage(id: metaData.id, data: imageData, thumbnail: thumbData, lat: metaData.lat, lng: metaData.lng, date: metaData.date, source: metaData.source, bearing: metaData.bearing, score: metaData.score, pitch: metaData.pitch, yaw: metaData.yaw, publicImage: metaData.publicImage))
                        
                    } catch {
                        receivedError = "Couldn't parse \(metaPath.path) as \(MetaData.self):\n\(error)"
                    }
                }
            } catch {
                receivedError = "Couldn't iterate cache directory!"
            }
            
            DispatchQueue.main.async {
                completion(images, receivedError)
            }
        }
    }
    
    func loadQuery(completion: @escaping (_ data: QueryVariables?, _ error: String?) -> ())  {
        var receivedError: String?
        
        DispatchQueue.global(qos: .background).async {
            let cachePath = self.getCacheDirectoryPath()
            
            var queryVariables: QueryVariables? = nil
            let metaPath = cachePath.appendingPathComponent("query.json")
            
            do {
                let rawMetaData = try Data(contentsOf: metaPath)
                let decoder = JSONDecoder()
                queryVariables = try decoder.decode(QueryVariables.self, from: rawMetaData)
                
                
            } catch {
                receivedError = "Couldn't parse \(metaPath.path) as \(QueryVariables.self):\n\(error)"
            }
            
            DispatchQueue.main.async {
                completion(queryVariables, receivedError)
            }
        }
    }
    
    func loadQueryImage(completion: @escaping (_ data: Data?, _ error: String?) -> ())  {
        var receivedError: String?
        
        DispatchQueue.global(qos: .background).async {
            var data: Data = Data()
            let path = self.getCacheDirectoryPath().appendingPathComponent("queryImage.jpg")
            
            do {
                data = try Data(contentsOf: path)
            } catch {
                receivedError = "Couldn't parse \(path.path) as \(Data.self):\n\(error)"
            }
            
            DispatchQueue.main.async {
                completion(data, receivedError)
            }
        }
    }
    
    /**
     Loads previously captured but not yet uploaded images from cache and returns list
     */
    func loadLocalImages(completion: @escaping (_ data: [ApiImage]?, _ error: String?) -> ())  {
        var images: [ApiImage]?
        var receivedError: String?
        
        DispatchQueue.global(qos: .background).async{
            let data: Data
            let path = self.getCacheDirectoryPath().appendingPathComponent("newImages.json")
            
            do {
                data = try Data(contentsOf: path)
            } catch {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                images = try decoder.decode([ApiImage].self, from: data)
            } catch {
                receivedError = "Couldn't parse \(path.path) as \([ApiImage].self):\n\(error)"
            }
            
            DispatchQueue.main.async {
                completion(images, receivedError)
            }
        }
    }
    
    func saveQueryToFile() {
        let cachePath = getCacheDirectoryPath()
        let metaPath = cachePath.appendingPathComponent("query.json")
        
        let queryVariables = QueryVariables(radius: self.radius, startDate: self.startDate, endDate: self.endDate, queryText: self.queryText, includeDate: self.includeDate, includeRadius: self.includeRadius, includeText: self.includeText, includeExample: self.includeExample, lat: self.queryLocation?.latitude ?? 0.0, lng: self.queryLocation?.longitude ?? 0.0)
        
        do {
            let jsonDataLocal = try JSONEncoder().encode(queryVariables)
            try jsonDataLocal.write(to: metaPath)
        } catch {
            print("Error writing metadata file: \(error)")
        }
        
        if capturedImage != Data() {
            let imagePath = cachePath.appendingPathComponent("queryImage.jpg")
            do {
                try capturedImage.write(to: imagePath)
            } catch {
                print("Error writing full image file: \(error)")
            }
        }
    }
    
    /**
     Saves all images to cache while invalidating old state
     */
    func saveImagesToFile() {
        let path = getCacheDirectoryPath().appendingPathComponent("images")
        do {
            try FileManager.default.removeItem(atPath: path.path)
        } catch let error as NSError {
            print("Unable to delete directory \(error.debugDescription)")
        }
        
        for image in self.explorerImages {
            let folderPath = getCacheDirectoryPath().appendingPathComponent("images").appendingPathComponent(image.id)
            do {
                try FileManager.default.createDirectory(atPath: folderPath.path, withIntermediateDirectories: true, attributes: nil)
            } catch let error as NSError {
                print("Unable to create directory \(error.debugDescription)")
            }
            let meta = MetaData(id: image.id, lat: image.lat, lng: image.lng, date: image.date, source: image.source, bearing: image.bearing, score: image.score, yaw: image.yaw, pitch: image.pitch, publicImage: image.publicImage)
            
            let metaPath = folderPath.appendingPathComponent("\(image.id).json")
            do {
                let jsonDataLocal = try JSONEncoder().encode(meta)
                try jsonDataLocal.write(to: metaPath)
            } catch {
                print("Error writing metadata file: \(error)")
            }
            
            if image.data != Data() {
                let imagePath = folderPath.appendingPathComponent("\(image.id).jpg")
                do {
                    try image.data.write(to: imagePath)
                } catch {
                    print("Error writing full image file: \(error)")
                }
            }
            
            if image.thumbnail != Data() {
                let thumbPath = folderPath.appendingPathComponent("\(image.id)-thumb.jpg")
                do {
                    try image.thumbnail.write(to: thumbPath)
                } catch {
                    print("Error writing thumbnail file: \(error)")
                }
            }
        }
        
        let pathLocal = getCacheDirectoryPath().appendingPathComponent("newImages.json")
        
        do {
            let jsonDataLocal = self.imagesToUpload.isEmpty ? Data() : try JSONEncoder().encode(self.imagesToUpload)
            try jsonDataLocal.write(to: pathLocal)
        } catch {
            print("Error writing to JSON file: \(error)")
        }
        dump(imagesToUpload)
        self.localFilesSynced = self.imagesToUpload.isEmpty
    }
    
    /**
     Returns cache directory path
     */
    func getCacheDirectoryPath() -> URL {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    }
}

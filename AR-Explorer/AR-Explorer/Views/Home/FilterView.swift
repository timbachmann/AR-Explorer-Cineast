//
//  FilterView.swift
//  CapVis-AR
//
//  Created by Tim Bachmann on 10.03.22.
//

import SwiftUI
import OpenAPIClient
import CoreLocation

struct FilterView: View {
    @Binding var showSelf: Bool
    @Binding var isLoading: Bool
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var radius: Double
    @Binding var queryText: String
    @Binding var includeDate: Bool
    @Binding var includeRadius: Bool
    @Binding var includeText: Bool
    @Binding var includeExample: Bool
    @Binding var queryLocation: CLLocationCoordinate2D?
    @State var showCamera: Bool = false
    @State var querying: Bool = false
    @State var capturedImage: Data = Data()
    @EnvironmentObject var imageData: ImageData
    @EnvironmentObject var locationManagerModel: LocationManagerModel
    
    
    var body: some View {
        NavigationLink(destination: CameraView(), isActive: $showCamera) {
            EmptyView()
        }
        ZStack {
            Color(UIColor.systemBackground)
            VStack(spacing: 24.0) {
                VStack(spacing: 24.0) {
                    HStack {
                        Toggle(isOn: $includeDate) {
                            Text("Date Range")
                        }
                        Spacer()
                    }
                    if ($includeDate.wrappedValue) {
                        HStack() {
                            Spacer()
                            DatePicker("", selection: $startDate, displayedComponents: [.date]).labelsHidden()
                            Spacer()
                            Text("-")
                            Spacer()
                            DatePicker("",selection: $endDate, displayedComponents: [.date]).labelsHidden()
                            Spacer()
                        }
                    }
                }
                Divider()
                VStack {
                    HStack {
                        Toggle(isOn: $includeRadius) {
                            Text("Radius")
                        }
                        Spacer()
                    }
                    if ($includeRadius.wrappedValue) {
                        if ($queryLocation.wrappedValue != nil) {
                            HStack {
                                Text("Location:")
                                Spacer()
                                Text("\(String(format: "%.5f", $queryLocation.wrappedValue!.latitude)), \(String(format: "%.5f", $queryLocation.wrappedValue!.longitude))")
                            }.padding()
                        } else {
                            HStack {
                                Text("Add location by tapping on map!").lineLimit(2).multilineTextAlignment(.leading)
                            }.padding()
                        }
                        
                        Slider(
                            value: $radius,
                            in: 1...100,
                            step: 1.0
                        )
                        Text("\(Int(radius)) km")
                    }
                }
                Divider()
                VStack {
                    HStack {
                        Toggle(isOn: $includeText) {
                            Text("Text Query")
                        }
                        Spacer()
                    }
                    if ($includeText.wrappedValue) {
                        TextField("", text: $queryText).textFieldStyle(.roundedBorder)
                    }
                }
                Divider()
                VStack {
                    HStack {
                        Toggle(isOn: $includeExample) {
                            Text("Query by Example")
                        }
                        Spacer()
                        
                    }
                    if ($includeExample.wrappedValue) {
                        HStack {
                            Button(action: {
                                $showCamera.wrappedValue.toggle()
                            }, label: {
                                Image(systemName: "camera")
                                    .foregroundColor(Color.accentColor)
                            })
                            .padding()
                            .background(Color(UIColor.lightGray).opacity(0.2))
                            .frame(width: 48.0, height: 48.0)
                            .cornerRadius(10.0, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                            Spacer()
                            if (UIImage(data: imageData.capturedImage) != nil) {
                                Image(uiImage: resizeImage(image: UIImage(data: imageData.capturedImage)!, maxSize: 48.0))
                                    .padding()
                            }
                        }
                    }
                }
                Divider()
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        $showSelf.wrappedValue.toggle()
                    }, label: {
                        HStack {
                            Image(systemName: "multiply.circle")
                                .foregroundColor(Color.accentColor)
                            Text("Cancel").foregroundColor(Color.accentColor)
                        }
                    })
                    Spacer()
                    Divider()
                    Spacer()
                    Button(action: {
                        queryImages()
                        $querying.wrappedValue = true
                    }, label: {
                        HStack {
                            Image(systemName: "text.magnifyingglass")
                                .foregroundColor(Color.accentColor)
                            Text("Apply").foregroundColor(Color.accentColor)
                        }
                    })
                    .disabled(!($includeDate.wrappedValue || $includeText.wrappedValue || $includeRadius.wrappedValue || $includeExample.wrappedValue))
                    Spacer()
                    
                }.frame(maxHeight: 52.0)
            }.padding()
            if ($querying.wrappedValue) {
                ZStack {
                    Color(UIColor.systemBackground).opacity(0.8)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(showSelf: .constant(true), isLoading: .constant(false), startDate: .constant(Date(timeIntervalSince1970: -3155673600.0)), endDate: .constant(Date()), radius: .constant(5.5), queryText: .constant(""), includeDate: .constant(false), includeRadius: .constant(false), includeText: .constant(false), includeExample: .constant(false), queryLocation: .constant(nil))
    }
}

extension FilterView {
    
    func queryImages() {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = .current
        formatter.timeZone = .current
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        var objectIds: [String] = []
        var apiImages: [ApiImage] = []
        var finalImages: [ApiImage] = []
        
        
        var queryTerms: [QueryTerm]  = []
        
        if ($includeDate.wrappedValue) {
            print(formatter.string(from: startDate))
            queryTerms.append(QueryTerm(categories: ["temporaldistance"], type: QueryTerm.ModelType.time, data: "\(formatter.string(from: startDate))"))
        }
        if ($includeRadius.wrappedValue && $queryLocation.wrappedValue != nil) {
            queryTerms.append(QueryTerm(categories: ["spatialdistance"], type: QueryTerm.ModelType.location, data: "[\($queryLocation.wrappedValue!.latitude), \(String($queryLocation.wrappedValue!.longitude))]"))
        }
        if ($includeText.wrappedValue) {
            queryTerms.append(QueryTerm(categories: ["visualtextcoembedding"], type: QueryTerm.ModelType.text, data: "\($queryText.wrappedValue)"))
        }
        if ($includeExample.wrappedValue) {
            if (imageData.capturedImage != Data()) {
                let uiImage = UIImage(data: imageData.capturedImage, scale: 0.1)!
                let uiImage2 = resizeImage(image: uiImage, maxSize: 500.0)
                let base64 = uiImage2.jpegData(compressionQuality: 0.1)!.base64EncodedString()
                queryTerms.append(QueryTerm(categories: ["globalcolor", "localcolor","edge"], type: QueryTerm.ModelType.image, data: "data:image/jpeg;base64,\(base64)"))
            } else {
                return
            }
        }
        
        let similarityQuery = SimilarityQuery(terms: queryTerms)
        
        SegmentsAPI.findSegmentSimilar(similarityQuery: similarityQuery) { (response, error) in
            guard error == nil else {
                print(error ?? "Could not query findSegmentSimilar!")
                return
            }
            
            if (response != nil) {
                var idList: [String] = []
                var keyValueList: [String: Double] = [:]
                var setList: [Set<String>] = []
                
                response?.results?.forEach { result in
                    let currSet: Set<String> = Set((result.content?.map{$0.key!})!)
                    setList.append(currSet)
                    
                    result.content?.forEach { pair in
                        if (keyValueList.keys.contains(pair.key!)) {
                            keyValueList[pair.key!] = (keyValueList[pair.key!]! + pair.value!)/2
                        } else {
                            keyValueList[pair.key!] = pair.value!
                        }
                    }
                }
                
                var finalSet: Set<String> = setList[0]
                
                for i in (1 ..< setList.count) {
                    finalSet = finalSet.intersection(setList[i])
                }
                
                let keyArray = Array(finalSet)
                keyValueList = keyValueList.filter{ keyArray.contains($0.key) }
                let sortedKeyValueList = keyValueList.sorted {$0.1 > $1.1}
                
                sortedKeyValueList.forEach { keyValue in
                    idList.append(keyValue.key)
                }
                
                SegmentAPI.findSegmentByIdBatched(idList: IdList(ids: idList)) { (response, error) in
                    guard error == nil else {
                        print(error ?? "Could not query findSegmentByIdBatched!")
                        return
                    }
                    
                    if (response != nil) {
                        response?.content?.forEach { element in
                            objectIds.append(element.objectId!)
                        }
                        
                        MetadataAPI.findMetadataForObjectIdBatched(optionallyFilteredIdList: OptionallyFilteredIdList(ids: objectIds)) { (response, error) in
                            guard error == nil else {
                                print(error ?? "Could not query findMetadataForObjectIdBatched!")
                                return
                            }
                            
                            if (response != nil) {
                                dump(response!)
                                objectIds.forEach{ id in
                                    apiImages.append(ApiImage(id: id))
                                }
                                
                                response?.content?.forEach { metadataElement in
                                    let index = apiImages.firstIndex(where: { $0.id == metadataElement.objectid })!
                                    
                                    switch metadataElement.domain! {
                                    case "LOCATION":
                                        print("LOCATION")
                                        if (metadataElement.key! == "latitude") {
                                            apiImages[index].lat = Double(metadataElement.value ?? "0") ?? 0.0
                                        } else if (metadataElement.key == "longitude") {
                                            apiImages[index].lng = Double(metadataElement.value ?? "0") ?? 0.0
                                        }
                                    case "TIME":
                                        apiImages[index].date = metadataElement.value!
                                    case "JSON":
                                        switch metadataElement.key {
                                        case "bearing":
                                            apiImages[index].bearing = Int(metadataElement.value ?? "0") ?? 0
                                        case "Photographer":
                                            apiImages[index].source = metadataElement.value!
                                        default:
                                            dump("JSON value could not be assigned")
                                        }
                                    default:
                                        dump("Metadata could not be assigned")
                                    }
                                }
                                    
                                apiImages.forEach { apiImage in
                                    
                                    let index = apiImages.firstIndex(where: { $0.id == apiImage.id })!
                                    apiImages[index].score = keyValueList[(apiImage.id + "_1")] ?? 0.0
                                    
                                    if ($includeRadius.wrappedValue && $queryLocation.wrappedValue != nil) {
                                        let nodeLocation = CLLocation(latitude: apiImage.lat, longitude: apiImage.lng)
                                        let distance = CLLocation(latitude: $queryLocation.wrappedValue!.latitude, longitude: $queryLocation.wrappedValue!.longitude).distance(from: nodeLocation)
                                        
                                        if distance > (radius*1000) {
                                            apiImages.remove(at: index)
                                            return
                                        }
                                    }
                                    
                                    if ($includeDate.wrappedValue) {
                                        let formatter = DateFormatter()
                                        formatter.calendar = Calendar(identifier: .iso8601)
                                        formatter.locale = .current
                                        formatter.timeZone = .current
                                        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                                        let date: Date? = formatter.date(from: apiImage.date) ?? nil
                                        
                                        if (date != nil) {
                                            if (min(startDate, endDate) ... max(startDate, endDate)).contains(date)) {
                                                apiImages.remove(at: index)
                                                return
                                            }
                                        }
                                    }
                                    
                                    DefaultAPI.getThumbnailsWithId(id: "\(apiImage.id)_1") { (response, error) in
                                        guard error == nil else {
                                            print(error ?? "Could not query thumbnail for \(apiImage.id)!")
                                            return
                                        }

                                        if (response != nil) {
                                            apiImages[index].thumbnail = response!
                                            finalImages.append(apiImages[index])

                                            DispatchQueue.main.async(execute: {
                                                apply(apiImages: finalImages)
                                            })
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func apply(apiImages: [ApiImage]) {
        imageData.explorerImages = apiImages
        $showSelf.wrappedValue = false
        $querying.wrappedValue = false
        imageData.explorerImages.sort(by: { $0.score > $1.score })
        imageData.saveImagesToFile()
    }
    
    func resizeImage(image: UIImage, maxSize: CGFloat) -> UIImage {
        let size = image.size
        
        var scaledSize = CGSize(width: maxSize, height: maxSize)
        let ratio = size.width / size.height
        if size.width > size.height {
            scaledSize.height = maxSize / ratio
        } else {
            scaledSize.width = maxSize * ratio
        }
        
        UIGraphicsBeginImageContextWithOptions(scaledSize, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: scaledSize))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage ?? image
    }

}


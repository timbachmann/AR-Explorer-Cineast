//
//  DetailView.swift
//  CapVis-AR
//
//  Created by Tim Bachmann on 10.03.22.
//

import SwiftUI
import OpenAPIClient

/**
 
 */
struct DetailView: View {
    
    @State var currentScale: CGFloat = 1.0
    @State var previousScale: CGFloat = 1.0
    @State var currentOffset = CGSize.zero
    @State var previousOffset = CGSize.zero
    
    @State private var detailImage: Image?
    @State private var detailDate: Text?
    @State private var detailScore: Text?
    @State private var detailSource: Text?
    var imageIndex: Int?
    @State var image: ApiImage = ApiImage()
    @State var index: Int? = nil
    @State var isLoading: Bool = true
    @State private var showingOptions = false
    @State private var showingUpdate = false
    @Binding var selectedTab: ContentView.Tab
    @EnvironmentObject var imageData: ImageData
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            if $isLoading.wrappedValue {
                ProgressView()
            } else {
                VStack {
                    Spacer()
                    detailImage?
                        .resizable()
                        .zIndex(1)
                        .aspectRatio(contentMode: .fit)
                        .offset(x: self.currentOffset.width, y: self.currentOffset.height)
                        .scaleEffect(max(self.currentScale, 1.0))
                        .gesture(MagnificationGesture()
                            .onChanged { value in
                                let delta = value / self.previousScale
                                self.previousScale = value
                                self.currentScale = self.currentScale * delta
                            }
                            .onEnded { value in self.previousScale = 1.0 }
                        )
                        .clipped()
                    Spacer()
                    detailScore ?? Text("").font(.subheadline)
                    Spacer()
                    Button(action: {
                        if image != ApiImage() {
                            imageData.navigationImage = image
                            selectedTab = .ar
                        }
                    }, label: {
                        HStack {
                            Image(systemName: "arrow.triangle.turn.up.right.diamond")
                                .foregroundColor(Color(uiColor: UIColor.systemBackground))
                            Text("Directions in AR")
                                .foregroundColor(Color(uiColor: UIColor.systemBackground))
                        }
                    })
                    .frame(width: 200.0, height: 48.0)
                    .background(Color.accentColor)
                    .cornerRadius(10.0, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .onAppear {
            loadImage()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    detailDate ?? Text("").font(.headline)
                    detailSource ?? Text("").font(.subheadline)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showingUpdate = true
                }, label: {
                    Image(systemName: "globe.europe.africa")
                        .foregroundColor(Color.accentColor)
                })
                .actionSheet(isPresented: $showingUpdate) {
                    return ActionSheet(title: Text("Make image public?"), buttons: [
                        .destructive(Text("Yes")){
                            
                            uploadImage(paramName: "key-that-is-ignored-file", fileName: image.id, image: UIImage(data: image.data)!)
                        },
                        .cancel()
                    ])
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showingOptions = true
                }, label: {
                    Image(systemName: "trash.circle")
                        .foregroundColor(Color.accentColor)
                })
                .actionSheet(isPresented: $showingOptions) {
                    return ActionSheet(title: Text("Delete image?"), buttons: [
                        .destructive(Text("Delete")){
                            
                            let localIndex = imageData.imagesToUpload.firstIndex{$0.id == image.id}
                            if (localIndex != nil) {
                                imageData.imagesToUpload.remove(at: localIndex!)
                            }
                            /*ImageAPI.deleteImageById(userID: UIDevice.current.identifierForVendor!.uuidString, imageId: image.id) { (response, error) in
                                guard error == nil else {
                                    print(error ?? "Could not delete image!")
                                    return
                                }
                                
                                if (response != nil) {
                                    imageData.explorerImages.remove(at: imageIndex!)
                                    imageData.saveImagesToFile()
                                    self.mode.wrappedValue.dismiss()
                                    dump(response)
                                }
                            }*/
                        },
                        .cancel()
                    ])
                }
                .disabled(true)
            }
        }
    }
}

extension DetailView {
    
    /**
     
     */
    func loadImage() {
        image = imageData.explorerImages[imageIndex ?? 0]
        
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = .current
        formatter.timeZone = .current
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date: Date = formatter.date(from: image.date) ?? Date()
        formatter.dateFormat = "dd.MM.yyyy"
        
        detailDate = Text(formatter.string(from: date))
        detailSource = Text(image.source)
        detailScore = Text("Score: " + String(format: "%.3f", image.score))
        
        if image.data == Data() {
            DefaultAPI.getObjectsWithId(id: "\(image.id)") { (response, error) in
                guard error == nil else {
                    print(error ?? "Could not query object \(image.id)!")
                    return
                }

                if (response != nil) {
                    
                    DispatchQueue.main.async(execute: {
                        index = imageData.explorerImages.firstIndex{$0.id == image.id}!
                        imageData.explorerImages[index!].data = response!
                        image = imageData.explorerImages[index!]
                        setImage()
                        imageData.saveImagesToFile()
                    })
                }
            }
        } else {
            setImage()
        }
    }
    
    /**
     
     */
    func setImage() {
        let uiImage = UIImage(data: image.data)
        detailImage = Image(uiImage: uiImage!)
        isLoading = false
    }
    
    func uploadImage(paramName: String, fileName: String, image: UIImage) {
        let url = URL(string: "https://areval.vitrivr.tech/upload-api")

        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString

        let session = URLSession.shared

        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"

        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var data = Data()
        let paramNameId = "key-that-is-ignored-id"
        
        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramNameId)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: text/plain \r\n\r\n".data(using: .utf8)!)
        data.append("\(fileName)".data(using: .utf8)!)
        data.append("\r\n".data(using: .utf8)!)
        
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName).jpg\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/jpeg \r\n\r\n".data(using: .utf8)!)
        data.append(image.jpegData(compressionQuality: 0.1)!)
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            if error == nil {
                var string = String(bytes: responseData!, encoding: .utf8)!.replacingOccurrences(of: "\r\n", with: "").replacingOccurrences(of: #"\ "#, with: "")
                
                let imagePath = string.split(separator: "'")[1]
                
                
                SessionAPI.startExtraction() { (response, error) in
                    guard error == nil else {
                        print(error ?? "Could not start extraction!")
                        return
                    }
                    
//                    var extractionContainer = ExtractionItemContainer(object: MediaObjectDescriptor(objectid: fileName + "-1", name: fileName + "-1.jpg", path: fileName + "-1.jpg", mediatype: .image, exists: false), metadata:  uri: String(imagePath))
                    var extractionContainerMessage = ExtractionContainerMessage(items: [extractionContainer])
                    SessionAPI.extractItem(extractionContainerMessage: extractionContainerMessage) { (response, error) in
                        guard error == nil else {
                            print(error ?? "Could not start extraction!")
                            return
                        }
                        
                        
                        
                    }
                    
                }
                
            } else {
                print(error ?? "error")
            }
        }).resume()
    }
}

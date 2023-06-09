//
//  ARViewRepresentable.swift
//  CapVis-AR
//
//  Created by Tim Bachmann on 28.01.22.
//

import ARKit
import SwiftUI
import OpenAPIClient
import CoreMotion
import MapKit

/**
 
 */
struct ARViewRepresentable: UIViewRepresentable {
    let arDelegate:ARDelegate
    @Binding var redrawImages: Bool
    @EnvironmentObject var imageData: ImageData
    @EnvironmentObject var locationManagerModel: LocationManagerModel
    @State var nodes: [SCNNode] = []
    
    /**
     
     */
    func makeUIView(context: Context) -> some UIView {
        let arView = ARSCNView(frame: .zero)
        //arView.showsStatistics = true
        //arView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
        arDelegate.setARView(arView)
        if imageData.navigationImage != nil {
            loadRoute()
        }
        loadImageNodes()
        return arView
    }
    
    /**
     
     */
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if redrawImages {
            
            arDelegate.removeAllNodes()
            loadImageNodes()
            if imageData.navigationImage != nil {
                arDelegate.removeAllPolyNodes()
                loadRoute()
            }
            redrawImages = false
        }
    }
    
    /**
     
     */
    func loadImageNodes() {
        for apiImage in imageData.explorerImages {
            let nodeLocation = CLLocation(latitude: apiImage.lat, longitude: apiImage.lng)
            let distance = locationManagerModel.location.distance(from: nodeLocation)
            
            if distance < 50 {
                if apiImage.data == Data() {
                    DefaultAPI.getObjectsWithId(id: "\(apiImage.id)") { (response, error) in
                        guard error == nil else {
                            print(error ?? "Could not query object \(apiImage.id)!")
                            return
                        }
                        
                        if (response != nil) {
                            
                            DispatchQueue.main.async(execute: {
                                let index = imageData.explorerImages.firstIndex{$0.id == apiImage.id}!
                                imageData.explorerImages[index].data = response!
                                createImageNode(image: imageData.explorerImages[index], location: nodeLocation)
                            })
                        }
                    }
                } else {
                    createImageNode(image: apiImage, location: nodeLocation)
                }
            } else {
                createIndicatorNode(image: apiImage, location: nodeLocation, distance: distance)
            }
        }
    }
    
    /**
     
     */
    func createImageNode(image: ApiImage, location: CLLocation) {
        let imageUI = UIImage(data: image.data, scale: CGFloat(1.0))!
        var width: CGFloat = 0
        var height: CGFloat = 0
        var finalBearing = image.bearing
        
        if image.pitch == -1.0 {
            width = imageUI.size.width
            height = imageUI.size.height
            finalBearing -= 90
        } else if image.pitch == 1.0 {
            width = imageUI.size.width
            height = imageUI.size.height
            finalBearing += 90
        } else {
            width = imageUI.size.height
            height = imageUI.size.width
        }
        
        let scnPlane = SCNPlane(width: width*0.0008, height: height*0.0008)
        let imageNode = SCNNode(geometry: scnPlane)
        imageNode.geometry?.firstMaterial?.diffuse.contents = imageUI
        imageNode.geometry?.firstMaterial?.isDoubleSided = true
        
        imageNode.worldPosition = translateNode(location, altitude: 0.0)
        
        let currentOrientation = GLKQuaternionMake(imageNode.orientation.x, imageNode.orientation.y, imageNode.orientation.z, imageNode.orientation.w)
        let bearingRotation = GLKQuaternionMakeWithAngleAndAxis(GLKMathDegreesToRadians(-Float(finalBearing)), 0, 1, 0)
        let yawRotation = GLKQuaternionMakeWithAngleAndAxis(GLKMathDegreesToRadians(0.0), 0, 0, 1)
        let finalOrientation = GLKQuaternionMultiply(GLKQuaternionMultiply(currentOrientation, bearingRotation), yawRotation)
        imageNode.orientation = SCNQuaternion(finalOrientation.x, finalOrientation.y, finalOrientation.z, finalOrientation.w)
        
        arDelegate.placeImage(imageNode: imageNode)
    }
    
    /**
     
     */
    func createIndicatorNode(image: ApiImage, location: CLLocation, distance: CLLocationDistance) {
        
        let skScene = SKScene(size: CGSize(width: 150, height: 100))
        skScene.backgroundColor = UIColor.clear

        let rectangle = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 150, height: 100), cornerRadius: 10)
        rectangle.fillColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        rectangle.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        rectangle.lineWidth = 1
        rectangle.alpha = 1.0
        let labelNode = SKLabelNode(text: String(Int(distance)) + "m")
        labelNode.fontSize = 32
        labelNode.position = CGPoint(x:75, y:60)
        labelNode.zRotation = CGFloat(GLKMathDegreesToRadians(180))
        skScene.addChild(rectangle)
        skScene.addChild(labelNode)
        
        let scnPlane = SCNPlane(width: 3.0, height: 2.0)
        let imageNode = SCNNode(geometry: scnPlane)
        imageNode.geometry?.firstMaterial?.diffuse.contents = skScene
        imageNode.geometry?.firstMaterial?.isDoubleSided = true
        
        let worldPos = translateNodeWithDistance(location, altitude: 0.0, distance: 10.0)
        imageNode.worldPosition = worldPos
        
        imageNode.pivot = SCNMatrix4MakeRotation(.pi, 0, 1, 0);
        let yFreeConstraint = SCNBillboardConstraint()
        imageNode.constraints = [yFreeConstraint]
        
        arDelegate.placeImage(imageNode: imageNode)
    }
    
    /**
     
     */
    func loadRoute() {
        let request = MKDirections.Request()
        request.transportType = .walking
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationManager().location!.coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: imageData.navigationImage!.lat, longitude: imageData.navigationImage!.lng)))
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let mapRoute = response?.routes.first else {
                return
            }
            
            let points = mapRoute.polyline.points()
            
            let startLineNode = SCNGeometry.cylinderLine(from: translateNode(locationManagerModel.location, altitude: -2.0), to: translateNode(CLLocation(coordinate: points[0].coordinate), altitude: -2.0), segments: 48)
            arDelegate.placePolyNode(polyNode: startLineNode)
            
            for i in 0 ..< mapRoute.polyline.pointCount - 1 {
                let currentLocation = CLLocation(coordinate: points[i].coordinate)
                let nextLocation = CLLocation(coordinate: points[i + 1].coordinate)
                
                let cylinderLineNode = SCNGeometry.cylinderLine(from: translateNode(currentLocation, altitude: -2.0), to: translateNode(nextLocation, altitude: -2.0), segments: 48)
                arDelegate.placePolyNode(polyNode: cylinderLineNode)
                
                addPolyPointNode(point: currentLocation, color: .green)
            }
            
            addPolyPointNode(point: CLLocation(coordinate: points[mapRoute.polyline.pointCount-1].coordinate), color: .green)
            let endLineNode = SCNGeometry.cylinderLine(from: translateNode(CLLocation(coordinate: points[mapRoute.polyline.pointCount-1].coordinate), altitude: -2.0), to: translateNode(CLLocation(coordinate: CLLocationCoordinate2D(latitude: imageData.navigationImage!.lat, longitude: imageData.navigationImage!.lng)), altitude: -2.0), segments: 48)
            arDelegate.placePolyNode(polyNode: endLineNode)
            
        }
    }
    
    /**
     
     */
    func addPolyPointNode(point: CLLocation, color: UIColor) {
        let scnSphere = SCNSphere(radius: 1.0)
        scnSphere.firstMaterial?.diffuse.contents = color
        let polyNode = SCNNode(geometry: scnSphere)
        
        polyNode.worldPosition = translateNode(point, altitude: -2.0)
        arDelegate.placePolyNode(polyNode: polyNode)
    }
    
    /**
     
     */
    func translateNode (_ location: CLLocation, altitude: CLLocationDistance) -> SCNVector3 {
        let currCameraTransform = arDelegate.cameraTransform ?? matrix_identity_float4x4
        let locationTransform = GeometryUtils.transformMatrix(currCameraTransform, locationManagerModel.location, location)
        return SCNVector3Make(locationTransform.columns.3.x, locationTransform.columns.3.y + Float(altitude), locationTransform.columns.3.z)
    }
    
    func translateNodeWithDistance (_ location: CLLocation, altitude: CLLocationDistance, distance: Double) -> SCNVector3 {
        let currCameraTransform = arDelegate.cameraTransform ?? matrix_identity_float4x4
        let locationTransform = GeometryUtils.transformMatrixWithDistance(currCameraTransform, locationManagerModel.location, location, distance)
        return SCNVector3Make(locationTransform.columns.3.x, locationTransform.columns.3.y + Float(altitude), locationTransform.columns.3.z)
    }
}

struct ARViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        ARViewRepresentable(arDelegate: ARDelegate(), redrawImages: .constant(false))
    }
}

extension SCNGeometry {
    
    /**
     
     */
    class func cylinderLine(from: SCNVector3, to: SCNVector3, segments: Int) -> SCNNode {
        let x1 = from.x
        let x2 = to.x
        let y1 = from.y
        let y2 = to.y
        let z1 = from.z
        let z2 = to.z
        
        let distance =  sqrtf((x2-x1) * (x2-x1) + (y2-y1) * (y2-y1) + (z2-z1) * (z2-z1))
        let cylinder = SCNCylinder(radius: 0.2, height: CGFloat(distance))
        cylinder.radialSegmentCount = segments
        cylinder.firstMaterial?.diffuse.contents = UIColor.blue
        let lineNode = SCNNode(geometry: cylinder)
        lineNode.position = SCNVector3(x: (from.x + to.x) / 2, y: (from.y + to.y) / 2, z: (from.z + to.z) / 2)
        lineNode.eulerAngles = SCNVector3(Float.pi / 2, acos((to.z-from.z)/distance), atan2((to.y-from.y),(to.x-from.x)))
        
        return lineNode
    }
}

extension CLLocation {
    convenience init(coordinate: CLLocationCoordinate2D) {
        self.init(coordinate: coordinate, altitude: 2.0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: Date())
    }
    
    func coordinateWithBearing(bearing: Double, distanceMeters: Double) -> CLLocationCoordinate2D {
        let phi = Double(GLKMathDegreesToRadians(Float(self.coordinate.latitude)))
        let lambda = Double(GLKMathDegreesToRadians(Float(self.coordinate.longitude)))
        let theta = Double(GLKMathDegreesToRadians(Float(bearing)))
        
        let sigma = distanceMeters / self.earthRadiusMeters()
        let a = sin(phi) * cos(sigma)
        let b = cos(phi) * sin(sigma) * cos(theta)
        let phi2 = asin(a + b)
        let c = sin(theta) * sin(sigma) * cos(phi)
        let d = cos(sigma) - sin(phi) * sin(phi2)
        let lambda2 = lambda + atan2(c, d)
        
        let result = CLLocationCoordinate2D(latitude: Double(GLKMathDegreesToRadians(Float(phi2))), longitude: Double(GLKMathDegreesToRadians(Float(lambda2))))
        return result
    }
    
    func earthRadiusMeters() -> Double {
        let WGS84EquatorialRadius  = 6_378_137.0
        let WGS84PolarRadius = 6_356_752.3
        
        let a = WGS84EquatorialRadius
        let b = WGS84PolarRadius
        let phi = Double(GLKMathDegreesToRadians(Float(self.coordinate.latitude)))
        
        let c = pow(a * a * cos(phi), 2)
        let d = pow(b * b * sin(phi), 2)
        let numerator = c + d
        
        let e = pow(a * cos(phi), 2)
        let f = pow(b * sin(phi), 2)
        let denominator = e + f
        
        let radius: Double = sqrt(numerator/denominator)
        print(radius)
        return radius
    }
}

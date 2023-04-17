//
// SegmentAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class SegmentAPI {

    /**
     Finds segments for specified id
     
     - parameter id: (path) The id of the segments 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findSegmentById(id: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: MediaSegmentQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findSegmentByIdWithRequestBuilder(id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Finds segments for specified id
     - GET /api/v1/find/segments/by/id/{id}
     - Finds segments for specified id
     - parameter id: (path) The id of the segments 
     - returns: RequestBuilder<MediaSegmentQueryResult> 
     */
    open class func findSegmentByIdWithRequestBuilder(id: String) -> RequestBuilder<MediaSegmentQueryResult> {
        var localVariablePath = "/api/v1/find/segments/by/id/{id}"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MediaSegmentQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Finds segments for specified ids
     
     - parameter idList: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findSegmentByIdBatched(idList: IdList? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: MediaSegmentQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findSegmentByIdBatchedWithRequestBuilder(idList: idList).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Finds segments for specified ids
     - POST /api/v1/find/segments/by/id
     - Finds segments for specified ids
     - parameter idList: (body)  (optional)
     - returns: RequestBuilder<MediaSegmentQueryResult> 
     */
    open class func findSegmentByIdBatchedWithRequestBuilder(idList: IdList? = nil) -> RequestBuilder<MediaSegmentQueryResult> {
        let localVariablePath = "/api/v1/find/segments/by/id"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: idList)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MediaSegmentQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find segments by their media object's id
     
     - parameter id: (path) The id of the media object to find segments fo 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findSegmentByObjectId(id: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: MediaSegmentQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findSegmentByObjectIdWithRequestBuilder(id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find segments by their media object's id
     - GET /api/v1/find/segments/all/object/{id}
     - Find segments by their media object's id
     - parameter id: (path) The id of the media object to find segments fo 
     - returns: RequestBuilder<MediaSegmentQueryResult> 
     */
    open class func findSegmentByObjectIdWithRequestBuilder(id: String) -> RequestBuilder<MediaSegmentQueryResult> {
        var localVariablePath = "/api/v1/find/segments/all/object/{id}"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MediaSegmentQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}
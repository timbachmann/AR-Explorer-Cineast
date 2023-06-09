//
// SegmentsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class SegmentsAPI {

    /**
     Find similar segments based on the given query
     
     - parameter similarityQuery: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findSegmentSimilar(similarityQuery: SimilarityQuery? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: SimilarityQueryResultBatch?, _ error: Error?) -> Void)) -> RequestTask {
        return findSegmentSimilarWithRequestBuilder(similarityQuery: similarityQuery).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find similar segments based on the given query
     - POST /api/v1/find/segments/similar
     - Performs a similarity search based on the formulated query
     - parameter similarityQuery: (body)  (optional)
     - returns: RequestBuilder<SimilarityQueryResultBatch> 
     */
    open class func findSegmentSimilarWithRequestBuilder(similarityQuery: SimilarityQuery? = nil) -> RequestBuilder<SimilarityQueryResultBatch> {
        let localVariablePath = "/api/v1/find/segments/similar"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: similarityQuery)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<SimilarityQueryResultBatch>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find similar segments based on the given staged query
     
     - parameter stagedSimilarityQuery: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findSegmentSimilarStaged(stagedSimilarityQuery: StagedSimilarityQuery? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: SimilarityQueryResultBatch?, _ error: Error?) -> Void)) -> RequestTask {
        return findSegmentSimilarStagedWithRequestBuilder(stagedSimilarityQuery: stagedSimilarityQuery).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find similar segments based on the given staged query
     - POST /api/v1/find/segments/similar/staged
     - Performs a similarity search based on the formulated query stages, executing each subsequent stage on the results of the previous stage
     - parameter stagedSimilarityQuery: (body)  (optional)
     - returns: RequestBuilder<SimilarityQueryResultBatch> 
     */
    open class func findSegmentSimilarStagedWithRequestBuilder(stagedSimilarityQuery: StagedSimilarityQuery? = nil) -> RequestBuilder<SimilarityQueryResultBatch> {
        let localVariablePath = "/api/v1/find/segments/similar/staged"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: stagedSimilarityQuery)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<SimilarityQueryResultBatch>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find similar segments based on the given temporal query
     
     - parameter temporalQuery: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findSegmentSimilarTemporal(temporalQuery: TemporalQuery? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: TemporalQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findSegmentSimilarTemporalWithRequestBuilder(temporalQuery: temporalQuery).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find similar segments based on the given temporal query
     - POST /api/v1/find/segments/similar/temporal
     - Performs a similarity search based on the formulated query stages in the given temporal order, scoring final results by their similarity to the specified temporal context
     - parameter temporalQuery: (body)  (optional)
     - returns: RequestBuilder<TemporalQueryResult> 
     */
    open class func findSegmentSimilarTemporalWithRequestBuilder(temporalQuery: TemporalQuery? = nil) -> RequestBuilder<TemporalQueryResult> {
        let localVariablePath = "/api/v1/find/segments/similar/temporal"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: temporalQuery)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<TemporalQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}

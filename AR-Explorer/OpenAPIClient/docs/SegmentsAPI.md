# SegmentsAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**findSegmentSimilar**](SegmentsAPI.md#findsegmentsimilar) | **POST** /api/v1/find/segments/similar | Find similar segments based on the given query
[**findSegmentSimilarStaged**](SegmentsAPI.md#findsegmentsimilarstaged) | **POST** /api/v1/find/segments/similar/staged | Find similar segments based on the given staged query
[**findSegmentSimilarTemporal**](SegmentsAPI.md#findsegmentsimilartemporal) | **POST** /api/v1/find/segments/similar/temporal | Find similar segments based on the given temporal query


# **findSegmentSimilar**
```swift
    open class func findSegmentSimilar(similarityQuery: SimilarityQuery? = nil, completion: @escaping (_ data: SimilarityQueryResultBatch?, _ error: Error?) -> Void)
```

Find similar segments based on the given query

Performs a similarity search based on the formulated query

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let similarityQuery = SimilarityQuery(terms: [QueryTerm(categories: ["categories_example"], type: "type_example", data: "data_example")], metadataAccessSpec: [MetadataAccessSpecification(type: "type_example", domain: "domain_example", key: "key_example")], config: QueryConfig(queryId: "queryId_example", hints: ["hints_example"], relevantSegmentIds: ["relevantSegmentIds_example"], distance: "distance_example", distanceWeights: [123], norm: 123, resultsPerModule: 123, maxResults: 123, distanceIfEmpty: nil, correspondenceFunctionIfEmpty: nil, correspondenceFunction: "TODO", distanceWeightsIfEmpty: nil, normIfEmpty: nil, rawResultsPerModule: 123), messageType: "messageType_example") // SimilarityQuery |  (optional)

// Find similar segments based on the given query
SegmentsAPI.findSegmentSimilar(similarityQuery: similarityQuery) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **similarityQuery** | [**SimilarityQuery**](SimilarityQuery.md) |  | [optional] 

### Return type

[**SimilarityQueryResultBatch**](SimilarityQueryResultBatch.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findSegmentSimilarStaged**
```swift
    open class func findSegmentSimilarStaged(stagedSimilarityQuery: StagedSimilarityQuery? = nil, completion: @escaping (_ data: SimilarityQueryResultBatch?, _ error: Error?) -> Void)
```

Find similar segments based on the given staged query

Performs a similarity search based on the formulated query stages, executing each subsequent stage on the results of the previous stage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let stagedSimilarityQuery = StagedSimilarityQuery(stages: [QueryStage(terms: [QueryTerm(categories: ["categories_example"], type: "type_example", data: "data_example")])], config: QueryConfig(queryId: "queryId_example", hints: ["hints_example"], relevantSegmentIds: ["relevantSegmentIds_example"], distance: "distance_example", distanceWeights: [123], norm: 123, resultsPerModule: 123, maxResults: 123, distanceIfEmpty: nil, correspondenceFunctionIfEmpty: nil, correspondenceFunction: "TODO", distanceWeightsIfEmpty: nil, normIfEmpty: nil, rawResultsPerModule: 123)) // StagedSimilarityQuery |  (optional)

// Find similar segments based on the given staged query
SegmentsAPI.findSegmentSimilarStaged(stagedSimilarityQuery: stagedSimilarityQuery) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **stagedSimilarityQuery** | [**StagedSimilarityQuery**](StagedSimilarityQuery.md) |  | [optional] 

### Return type

[**SimilarityQueryResultBatch**](SimilarityQueryResultBatch.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findSegmentSimilarTemporal**
```swift
    open class func findSegmentSimilarTemporal(temporalQuery: TemporalQuery? = nil, completion: @escaping (_ data: TemporalQueryResult?, _ error: Error?) -> Void)
```

Find similar segments based on the given temporal query

Performs a similarity search based on the formulated query stages in the given temporal order, scoring final results by their similarity to the specified temporal context

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let temporalQuery = TemporalQuery(queries: [StagedSimilarityQuery(stages: [QueryStage(terms: [QueryTerm(categories: ["categories_example"], type: "type_example", data: "data_example")])], config: QueryConfig(queryId: "queryId_example", hints: ["hints_example"], relevantSegmentIds: ["relevantSegmentIds_example"], distance: "distance_example", distanceWeights: [123], norm: 123, resultsPerModule: 123, maxResults: 123, distanceIfEmpty: nil, correspondenceFunctionIfEmpty: nil, correspondenceFunction: "TODO", distanceWeightsIfEmpty: nil, normIfEmpty: nil, rawResultsPerModule: 123))], metadataAccessSpec: [MetadataAccessSpecification(type: "type_example", domain: "domain_example", key: "key_example")], config: TemporalQueryConfig(queryId: "queryId_example", hints: ["hints_example"], timeDistances: [123], maxLength: 123, computeTemporalObjects: false, relevantSegmentIds: ["relevantSegmentIds_example"], distance: "distance_example", distanceWeights: [123], norm: 123, resultsPerModule: 123, maxResults: 123, distanceIfEmpty: nil, correspondenceFunctionIfEmpty: nil, correspondenceFunction: "TODO", distanceWeightsIfEmpty: nil, normIfEmpty: nil, rawResultsPerModule: 123), messageType: "messageType_example") // TemporalQuery |  (optional)

// Find similar segments based on the given temporal query
SegmentsAPI.findSegmentSimilarTemporal(temporalQuery: temporalQuery) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **temporalQuery** | [**TemporalQuery**](TemporalQuery.md) |  | [optional] 

### Return type

[**TemporalQueryResult**](TemporalQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


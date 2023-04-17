# SegmentAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**findSegmentById**](SegmentAPI.md#findsegmentbyid) | **GET** /api/v1/find/segments/by/id/{id} | Finds segments for specified id
[**findSegmentByIdBatched**](SegmentAPI.md#findsegmentbyidbatched) | **POST** /api/v1/find/segments/by/id | Finds segments for specified ids
[**findSegmentByObjectId**](SegmentAPI.md#findsegmentbyobjectid) | **GET** /api/v1/find/segments/all/object/{id} | Find segments by their media object&#39;s id


# **findSegmentById**
```swift
    open class func findSegmentById(id: String, completion: @escaping (_ data: MediaSegmentQueryResult?, _ error: Error?) -> Void)
```

Finds segments for specified id

Finds segments for specified id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The id of the segments

// Finds segments for specified id
SegmentAPI.findSegmentById(id: id) { (response, error) in
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
 **id** | **String** | The id of the segments | 

### Return type

[**MediaSegmentQueryResult**](MediaSegmentQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findSegmentByIdBatched**
```swift
    open class func findSegmentByIdBatched(idList: IdList? = nil, completion: @escaping (_ data: MediaSegmentQueryResult?, _ error: Error?) -> Void)
```

Finds segments for specified ids

Finds segments for specified ids

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let idList = IdList(ids: ["ids_example"]) // IdList |  (optional)

// Finds segments for specified ids
SegmentAPI.findSegmentByIdBatched(idList: idList) { (response, error) in
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
 **idList** | [**IdList**](IdList.md) |  | [optional] 

### Return type

[**MediaSegmentQueryResult**](MediaSegmentQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findSegmentByObjectId**
```swift
    open class func findSegmentByObjectId(id: String, completion: @escaping (_ data: MediaSegmentQueryResult?, _ error: Error?) -> Void)
```

Find segments by their media object's id

Find segments by their media object's id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The id of the media object to find segments fo

// Find segments by their media object's id
SegmentAPI.findSegmentByObjectId(id: id) { (response, error) in
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
 **id** | **String** | The id of the media object to find segments fo | 

### Return type

[**MediaSegmentQueryResult**](MediaSegmentQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


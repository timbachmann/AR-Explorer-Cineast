# TagAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**findAllTags**](TagAPI.md#findalltags) | **GET** /api/v1/find/tags/all | Find all tags
[**findTagsBy**](TagAPI.md#findtagsby) | **GET** /api/v1/find/tags/by/{attribute}/{value} | Find all tags specified by attribute value
[**findTagsById**](TagAPI.md#findtagsbyid) | **POST** /api/v1/tags/by/id | Find all tags by ids


# **findAllTags**
```swift
    open class func findAllTags(completion: @escaping (_ data: TagsQueryResult?, _ error: Error?) -> Void)
```

Find all tags

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Find all tags
TagAPI.findAllTags() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**TagsQueryResult**](TagsQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findTagsBy**
```swift
    open class func findTagsBy(attribute: String, value: String, completion: @escaping (_ data: TagsQueryResult?, _ error: Error?) -> Void)
```

Find all tags specified by attribute value

Find all tags by attributes id, name or matchingname and filter value

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let attribute = "attribute_example" // String | The attribute to filter on. One of: id, name, matchingname
let value = "value_example" // String | The value of the attribute to filter

// Find all tags specified by attribute value
TagAPI.findTagsBy(attribute: attribute, value: value) { (response, error) in
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
 **attribute** | **String** | The attribute to filter on. One of: id, name, matchingname | 
 **value** | **String** | The value of the attribute to filter | 

### Return type

[**TagsQueryResult**](TagsQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findTagsById**
```swift
    open class func findTagsById(idList: IdList? = nil, completion: @escaping (_ data: TagsQueryResult?, _ error: Error?) -> Void)
```

Find all tags by ids

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let idList = IdList(ids: ["ids_example"]) // IdList |  (optional)

// Find all tags by ids
TagAPI.findTagsById(idList: idList) { (response, error) in
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

[**TagsQueryResult**](TagsQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


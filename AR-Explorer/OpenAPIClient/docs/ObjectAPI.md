# ObjectAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**findObjectsAll**](ObjectAPI.md#findobjectsall) | **GET** /api/v1/find/objects/all | Find all objects for a certain type
[**findObjectsByAttribute**](ObjectAPI.md#findobjectsbyattribute) | **GET** /api/v1/find/object/by/{attribute}/{value} | Find object by specified attribute value. I.e by id, name or path
[**findObjectsByIdBatched**](ObjectAPI.md#findobjectsbyidbatched) | **POST** /api/v1/find/object/by/id | Find objects by id
[**findObjectsPagination**](ObjectAPI.md#findobjectspagination) | **GET** /api/v1/find/object/all/{skip}/{limit} | Get a fixed amount of objects from the sorted list


# **findObjectsAll**
```swift
    open class func findObjectsAll(completion: @escaping (_ data: MediaObjectQueryResult?, _ error: Error?) -> Void)
```

Find all objects for a certain type

Find all objects for a certain type

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Find all objects for a certain type
ObjectAPI.findObjectsAll() { (response, error) in
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

[**MediaObjectQueryResult**](MediaObjectQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findObjectsByAttribute**
```swift
    open class func findObjectsByAttribute(attribute: String, value: String, completion: @escaping (_ data: MediaObjectQueryResult?, _ error: Error?) -> Void)
```

Find object by specified attribute value. I.e by id, name or path

Find object by specified attribute value. I.e by id, name or path

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let attribute = "attribute_example" // String | The attribute type of the value. One of: id, name, path
let value = "value_example" // String | The actual value that you want to filter for

// Find object by specified attribute value. I.e by id, name or path
ObjectAPI.findObjectsByAttribute(attribute: attribute, value: value) { (response, error) in
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
 **attribute** | **String** | The attribute type of the value. One of: id, name, path | 
 **value** | **String** | The actual value that you want to filter for | 

### Return type

[**MediaObjectQueryResult**](MediaObjectQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findObjectsByIdBatched**
```swift
    open class func findObjectsByIdBatched(idList: IdList? = nil, completion: @escaping (_ data: MediaObjectQueryResult?, _ error: Error?) -> Void)
```

Find objects by id

Find objects by id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let idList = IdList(ids: ["ids_example"]) // IdList |  (optional)

// Find objects by id
ObjectAPI.findObjectsByIdBatched(idList: idList) { (response, error) in
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

[**MediaObjectQueryResult**](MediaObjectQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findObjectsPagination**
```swift
    open class func findObjectsPagination(skip: Int, limit: Int, completion: @escaping (_ data: MediaObjectQueryResult?, _ error: Error?) -> Void)
```

Get a fixed amount of objects from the sorted list

Equivalent to calling SELECT * FROM multimediaobject ORDER BY objectid ASC LIMIT limit SKIP skip. Mostly used for pagination when wanting to retrieve all objects

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let skip = 987 // Int | How many objects should be skipped
let limit = 987 // Int | How many object at most should be fetched

// Get a fixed amount of objects from the sorted list
ObjectAPI.findObjectsPagination(skip: skip, limit: limit) { (response, error) in
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
 **skip** | **Int** | How many objects should be skipped | 
 **limit** | **Int** | How many object at most should be fetched | 

### Return type

[**MediaObjectQueryResult**](MediaObjectQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


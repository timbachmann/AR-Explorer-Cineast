# SessionAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**extractItem**](SessionAPI.md#extractitem) | **POST** /api/v1/extract/new | Extract new item
[**startExtraction**](SessionAPI.md#startextraction) | **POST** /api/v1/extract/start | Start a new extraction session
[**stopExtraction**](SessionAPI.md#stopextraction) | **POST** /api/v1/extract/stop | Stop the active extraction session


# **extractItem**
```swift
    open class func extractItem(extractionContainerMessage: ExtractionContainerMessage? = nil, completion: @escaping (_ data: SessionMessage?, _ error: Error?) -> Void)
```

Extract new item

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let extractionContainerMessage = ExtractionContainerMessage(items: [ExtractionItemContainer(object: MediaObjectDescriptor(objectid: "objectid_example", name: "name_example", path: "path_example", mediatype: "mediatype_example", exists: false, contentURL: "contentURL_example"), metadata: [MediaObjectMetadataDescriptor(objectid: "objectid_example", domain: "domain_example", key: "key_example", value: "value_example", exists: false)], uri: "uri_example")]) // ExtractionContainerMessage |  (optional)

// Extract new item
SessionAPI.extractItem(extractionContainerMessage: extractionContainerMessage) { (response, error) in
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
 **extractionContainerMessage** | [**ExtractionContainerMessage**](ExtractionContainerMessage.md) |  | [optional] 

### Return type

[**SessionMessage**](SessionMessage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startExtraction**
```swift
    open class func startExtraction(completion: @escaping (_ data: SessionMessage?, _ error: Error?) -> Void)
```

Start a new extraction session

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Start a new extraction session
SessionAPI.startExtraction() { (response, error) in
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

[**SessionMessage**](SessionMessage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **stopExtraction**
```swift
    open class func stopExtraction(completion: @escaping (_ data: SessionMessage?, _ error: Error?) -> Void)
```

Stop the active extraction session

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Stop the active extraction session
SessionAPI.stopExtraction() { (response, error) in
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

[**SessionMessage**](SessionMessage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


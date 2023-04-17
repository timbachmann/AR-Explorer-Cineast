# MetadataAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**findFeaturesByCategory**](MetadataAPI.md#findfeaturesbycategory) | **POST** /api/v1/find/feature/all/by/category/{category} | Find features for the given category for all (or specific) IDs
[**findFeaturesByEntity**](MetadataAPI.md#findfeaturesbyentity) | **POST** /api/v1/find/feature/all/by/entity/{entity} | Find features for the given entity name for all (or specific) IDs
[**findMetaById**](MetadataAPI.md#findmetabyid) | **GET** /api/v1/find/metadata/by/id/{id} | Find metadata for the given object id
[**findMetaFullyQualified**](MetadataAPI.md#findmetafullyqualified) | **GET** /api/v1/find/metadata/of/{id}/in/{domain}/with/{key} | Find metadata for specific object id in given domain with given key
[**findMetadataByDomain**](MetadataAPI.md#findmetadatabydomain) | **GET** /api/v1/find/metadata/in/{domain}/by/id/{id} | Find metadata for specific object id in given domain
[**findMetadataByDomainBatched**](MetadataAPI.md#findmetadatabydomainbatched) | **POST** /api/v1/find/metadata/in/{domain} | Find metadata in the specified domain for all the given ids
[**findMetadataByKey**](MetadataAPI.md#findmetadatabykey) | **GET** /api/v1/find/metadata/with/{key}/by/id/{id} | Find metadata for a given object id with specified key
[**findMetadataByKeyBatched**](MetadataAPI.md#findmetadatabykeybatched) | **POST** /api/v1/find/metadata/with/{key} | Find metadata for a given object id with specified key
[**findMetadataForObjectIdBatched**](MetadataAPI.md#findmetadataforobjectidbatched) | **POST** /api/v1/find/metadata/by/id | Finds metadata for the given list of object ids
[**findSegFeatById**](MetadataAPI.md#findsegfeatbyid) | **GET** /api/v1/find/feature/all/by/id/{id} | Find features for the given id
[**findSegMetaById**](MetadataAPI.md#findsegmetabyid) | **GET** /api/v1/find/metadata/by/segmentid/{id} | Find metadata for the given segment id
[**findTagInformationById**](MetadataAPI.md#findtaginformationbyid) | **GET** /api/v1/find/feature/tags/by/id/{id} | Find tag ids for the given id
[**findTextByIDAndCat**](MetadataAPI.md#findtextbyidandcat) | **GET** /api/v1/find/feature/text/by/{id}/{category} | Find Text for the given id and retrieval category


# **findFeaturesByCategory**
```swift
    open class func findFeaturesByCategory(category: String, idList: IdList? = nil, completion: @escaping (_ data: FeaturesByCategoryQueryResult?, _ error: Error?) -> Void)
```

Find features for the given category for all (or specific) IDs

Find features for the given category for all (or specific) IDs

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let category = "category_example" // String | 
let idList = IdList(ids: ["ids_example"]) // IdList |  (optional)

// Find features for the given category for all (or specific) IDs
MetadataAPI.findFeaturesByCategory(category: category, idList: idList) { (response, error) in
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
 **category** | **String** |  | 
 **idList** | [**IdList**](IdList.md) |  | [optional] 

### Return type

[**FeaturesByCategoryQueryResult**](FeaturesByCategoryQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findFeaturesByEntity**
```swift
    open class func findFeaturesByEntity(entity: String, idList: IdList? = nil, completion: @escaping (_ data: FeaturesByEntityQueryResult?, _ error: Error?) -> Void)
```

Find features for the given entity name for all (or specific) IDs

Find features for the given entity name for all (or specific) IDs

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let entity = "entity_example" // String | 
let idList = IdList(ids: ["ids_example"]) // IdList |  (optional)

// Find features for the given entity name for all (or specific) IDs
MetadataAPI.findFeaturesByEntity(entity: entity, idList: idList) { (response, error) in
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
 **entity** | **String** |  | 
 **idList** | [**IdList**](IdList.md) |  | [optional] 

### Return type

[**FeaturesByEntityQueryResult**](FeaturesByEntityQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findMetaById**
```swift
    open class func findMetaById(id: String, completion: @escaping (_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)
```

Find metadata for the given object id

Find metadata by the given object id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The object id to find metadata of

// Find metadata for the given object id
MetadataAPI.findMetaById(id: id) { (response, error) in
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
 **id** | **String** | The object id to find metadata of | 

### Return type

[**MediaObjectMetadataQueryResult**](MediaObjectMetadataQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findMetaFullyQualified**
```swift
    open class func findMetaFullyQualified(id: String, domain: String, key: String, completion: @escaping (_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)
```

Find metadata for specific object id in given domain with given key

The description

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The object id
let domain = "domain_example" // String | The domain name
let key = "key_example" // String | Metadata key

// Find metadata for specific object id in given domain with given key
MetadataAPI.findMetaFullyQualified(id: id, domain: domain, key: key) { (response, error) in
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
 **id** | **String** | The object id | 
 **domain** | **String** | The domain name | 
 **key** | **String** | Metadata key | 

### Return type

[**MediaObjectMetadataQueryResult**](MediaObjectMetadataQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findMetadataByDomain**
```swift
    open class func findMetadataByDomain(domain: String, id: String, completion: @escaping (_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)
```

Find metadata for specific object id in given domain

Find metadata for specific object id in given domain

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let domain = "domain_example" // String | The domain of the metadata to find
let id = "id_example" // String | The object id of the multimedia object to find metadata for

// Find metadata for specific object id in given domain
MetadataAPI.findMetadataByDomain(domain: domain, id: id) { (response, error) in
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
 **domain** | **String** | The domain of the metadata to find | 
 **id** | **String** | The object id of the multimedia object to find metadata for | 

### Return type

[**MediaObjectMetadataQueryResult**](MediaObjectMetadataQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findMetadataByDomainBatched**
```swift
    open class func findMetadataByDomainBatched(domain: String, idList: IdList? = nil, completion: @escaping (_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)
```

Find metadata in the specified domain for all the given ids

Find metadata in the specified domain for all the given ids

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let domain = "domain_example" // String | The domain of the metadata to find
let idList = IdList(ids: ["ids_example"]) // IdList |  (optional)

// Find metadata in the specified domain for all the given ids
MetadataAPI.findMetadataByDomainBatched(domain: domain, idList: idList) { (response, error) in
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
 **domain** | **String** | The domain of the metadata to find | 
 **idList** | [**IdList**](IdList.md) |  | [optional] 

### Return type

[**MediaObjectMetadataQueryResult**](MediaObjectMetadataQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findMetadataByKey**
```swift
    open class func findMetadataByKey(key: String, id: String, completion: @escaping (_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)
```

Find metadata for a given object id with specified key

Find metadata for a given object id with specified key

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let key = "key_example" // String | The key of the metadata to find
let id = "id_example" // String | The object id of for which the metadata should be find

// Find metadata for a given object id with specified key
MetadataAPI.findMetadataByKey(key: key, id: id) { (response, error) in
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
 **key** | **String** | The key of the metadata to find | 
 **id** | **String** | The object id of for which the metadata should be find | 

### Return type

[**MediaObjectMetadataQueryResult**](MediaObjectMetadataQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findMetadataByKeyBatched**
```swift
    open class func findMetadataByKeyBatched(key: String, idList: IdList? = nil, completion: @escaping (_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)
```

Find metadata for a given object id with specified key

Find metadata with a the speicifed key from the path across all domains and for the provided ids

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let key = "key_example" // String | The key of the metadata to find
let idList = IdList(ids: ["ids_example"]) // IdList |  (optional)

// Find metadata for a given object id with specified key
MetadataAPI.findMetadataByKeyBatched(key: key, idList: idList) { (response, error) in
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
 **key** | **String** | The key of the metadata to find | 
 **idList** | [**IdList**](IdList.md) |  | [optional] 

### Return type

[**MediaObjectMetadataQueryResult**](MediaObjectMetadataQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findMetadataForObjectIdBatched**
```swift
    open class func findMetadataForObjectIdBatched(optionallyFilteredIdList: OptionallyFilteredIdList? = nil, completion: @escaping (_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)
```

Finds metadata for the given list of object ids

Finds metadata for the given list of object ids

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let optionallyFilteredIdList = OptionallyFilteredIdList(filters: [AbstractMetadataFilterDescriptor(keywords: ["keywords_example"], type: "type_example")], ids: ["ids_example"]) // OptionallyFilteredIdList |  (optional)

// Finds metadata for the given list of object ids
MetadataAPI.findMetadataForObjectIdBatched(optionallyFilteredIdList: optionallyFilteredIdList) { (response, error) in
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
 **optionallyFilteredIdList** | [**OptionallyFilteredIdList**](OptionallyFilteredIdList.md) |  | [optional] 

### Return type

[**MediaObjectMetadataQueryResult**](MediaObjectMetadataQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findSegFeatById**
```swift
    open class func findSegFeatById(id: String, completion: @escaping (_ data: FeaturesAllCategoriesQueryResult?, _ error: Error?) -> Void)
```

Find features for the given id

Find features by the given id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The id to find features of

// Find features for the given id
MetadataAPI.findSegFeatById(id: id) { (response, error) in
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
 **id** | **String** | The id to find features of | 

### Return type

[**FeaturesAllCategoriesQueryResult**](FeaturesAllCategoriesQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findSegMetaById**
```swift
    open class func findSegMetaById(id: String, completion: @escaping (_ data: MediaSegmentMetadataQueryResult?, _ error: Error?) -> Void)
```

Find metadata for the given segment id

Find metadata by the given segment id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The segment id to find metadata of

// Find metadata for the given segment id
MetadataAPI.findSegMetaById(id: id) { (response, error) in
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
 **id** | **String** | The segment id to find metadata of | 

### Return type

[**MediaSegmentMetadataQueryResult**](MediaSegmentMetadataQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findTagInformationById**
```swift
    open class func findTagInformationById(id: String, completion: @escaping (_ data: TagIDsForElementQueryResult?, _ error: Error?) -> Void)
```

Find tag ids for the given id

Find tag ids for the given id

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The id to find tagids of

// Find tag ids for the given id
MetadataAPI.findTagInformationById(id: id) { (response, error) in
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
 **id** | **String** | The id to find tagids of | 

### Return type

[**TagIDsForElementQueryResult**](TagIDsForElementQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findTextByIDAndCat**
```swift
    open class func findTextByIDAndCat(id: String, category: String, completion: @escaping (_ data: FeaturesTextCategoryQueryResult?, _ error: Error?) -> Void)
```

Find Text for the given id and retrieval category

Find Text by the given id and retrieval category

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The id to find text of
let category = "category_example" // String | The category for which retrieval shall be performed

// Find Text for the given id and retrieval category
MetadataAPI.findTextByIDAndCat(id: id, category: category) { (response, error) in
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
 **id** | **String** | The id to find text of | 
 **category** | **String** | The category for which retrieval shall be performed | 

### Return type

[**FeaturesTextCategoryQueryResult**](FeaturesTextCategoryQueryResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


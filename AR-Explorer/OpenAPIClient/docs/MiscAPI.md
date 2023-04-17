# MiscAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**countRows**](MiscAPI.md#countrows) | **GET** /api/v1/count/table/{table} | Count objects
[**findDistinctElementsByColumn**](MiscAPI.md#finddistinctelementsbycolumn) | **POST** /api/v1/find/boolean/column/distinct | Find all distinct elements of a given column
[**selectFromTable**](MiscAPI.md#selectfromtable) | **POST** /api/v1/find/boolean/table/select | Find all elements of given columns


# **countRows**
```swift
    open class func countRows(table: String, completion: @escaping (_ data: IntegerMessage?, _ error: Error?) -> Void)
```

Count objects

Equivalent to calling SELECT count(*) FROM table. Used to determined #pages for pagination in a frontend or statistical purposes

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let table = "table_example" // String | 

// Count objects
MiscAPI.countRows(table: table) { (response, error) in
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
 **table** | **String** |  | 

### Return type

[**IntegerMessage**](IntegerMessage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findDistinctElementsByColumn**
```swift
    open class func findDistinctElementsByColumn(columnSpecification: ColumnSpecification? = nil, completion: @escaping (_ data: DistinctElementsResult?, _ error: Error?) -> Void)
```

Find all distinct elements of a given column

Find all distinct elements of a given column. Please note that this operation does cache results.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let columnSpecification = ColumnSpecification(column: "column_example", table: "table_example") // ColumnSpecification |  (optional)

// Find all distinct elements of a given column
MiscAPI.findDistinctElementsByColumn(columnSpecification: columnSpecification) { (response, error) in
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
 **columnSpecification** | [**ColumnSpecification**](ColumnSpecification.md) |  | [optional] 

### Return type

[**DistinctElementsResult**](DistinctElementsResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **selectFromTable**
```swift
    open class func selectFromTable(selectSpecification: SelectSpecification? = nil, completion: @escaping (_ data: SelectResult?, _ error: Error?) -> Void)
```

Find all elements of given columns

Find all elements of given columns

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let selectSpecification = SelectSpecification(table: "table_example", columns: ["columns_example"], limit: 123) // SelectSpecification |  (optional)

// Find all elements of given columns
MiscAPI.selectFromTable(selectSpecification: selectSpecification) { (response, error) in
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
 **selectSpecification** | [**SelectSpecification**](SelectSpecification.md) |  | [optional] 

### Return type

[**SelectResult**](SelectResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


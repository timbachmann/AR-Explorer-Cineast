//
// MetadataAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class MetadataAPI {

    /**
     Find features for the given category for all (or specific) IDs
     
     - parameter category: (path)  
     - parameter idList: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findFeaturesByCategory(category: String, idList: IdList? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: FeaturesByCategoryQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findFeaturesByCategoryWithRequestBuilder(category: category, idList: idList).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find features for the given category for all (or specific) IDs
     - POST /api/v1/find/feature/all/by/category/{category}
     - Find features for the given category for all (or specific) IDs
     - parameter category: (path)  
     - parameter idList: (body)  (optional)
     - returns: RequestBuilder<FeaturesByCategoryQueryResult> 
     */
    open class func findFeaturesByCategoryWithRequestBuilder(category: String, idList: IdList? = nil) -> RequestBuilder<FeaturesByCategoryQueryResult> {
        var localVariablePath = "/api/v1/find/feature/all/by/category/{category}"
        let categoryPreEscape = "\(APIHelper.mapValueToPathItem(category))"
        let categoryPostEscape = categoryPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{category}", with: categoryPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: idList)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<FeaturesByCategoryQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find features for the given entity name for all (or specific) IDs
     
     - parameter entity: (path)  
     - parameter idList: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findFeaturesByEntity(entity: String, idList: IdList? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: FeaturesByEntityQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findFeaturesByEntityWithRequestBuilder(entity: entity, idList: idList).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find features for the given entity name for all (or specific) IDs
     - POST /api/v1/find/feature/all/by/entity/{entity}
     - Find features for the given entity name for all (or specific) IDs
     - parameter entity: (path)  
     - parameter idList: (body)  (optional)
     - returns: RequestBuilder<FeaturesByEntityQueryResult> 
     */
    open class func findFeaturesByEntityWithRequestBuilder(entity: String, idList: IdList? = nil) -> RequestBuilder<FeaturesByEntityQueryResult> {
        var localVariablePath = "/api/v1/find/feature/all/by/entity/{entity}"
        let entityPreEscape = "\(APIHelper.mapValueToPathItem(entity))"
        let entityPostEscape = entityPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{entity}", with: entityPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: idList)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<FeaturesByEntityQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find metadata for the given object id
     
     - parameter id: (path) The object id to find metadata of 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findMetaById(id: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findMetaByIdWithRequestBuilder(id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find metadata for the given object id
     - GET /api/v1/find/metadata/by/id/{id}
     - Find metadata by the given object id
     - parameter id: (path) The object id to find metadata of 
     - returns: RequestBuilder<MediaObjectMetadataQueryResult> 
     */
    open class func findMetaByIdWithRequestBuilder(id: String) -> RequestBuilder<MediaObjectMetadataQueryResult> {
        var localVariablePath = "/api/v1/find/metadata/by/id/{id}"
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

        let localVariableRequestBuilder: RequestBuilder<MediaObjectMetadataQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find metadata for specific object id in given domain with given key
     
     - parameter id: (path) The object id 
     - parameter domain: (path) The domain name 
     - parameter key: (path) Metadata key 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findMetaFullyQualified(id: String, domain: String, key: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findMetaFullyQualifiedWithRequestBuilder(id: id, domain: domain, key: key).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find metadata for specific object id in given domain with given key
     - GET /api/v1/find/metadata/of/{id}/in/{domain}/with/{key}
     - The description
     - parameter id: (path) The object id 
     - parameter domain: (path) The domain name 
     - parameter key: (path) Metadata key 
     - returns: RequestBuilder<MediaObjectMetadataQueryResult> 
     */
    open class func findMetaFullyQualifiedWithRequestBuilder(id: String, domain: String, key: String) -> RequestBuilder<MediaObjectMetadataQueryResult> {
        var localVariablePath = "/api/v1/find/metadata/of/{id}/in/{domain}/with/{key}"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let domainPreEscape = "\(APIHelper.mapValueToPathItem(domain))"
        let domainPostEscape = domainPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{domain}", with: domainPostEscape, options: .literal, range: nil)
        let keyPreEscape = "\(APIHelper.mapValueToPathItem(key))"
        let keyPostEscape = keyPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{key}", with: keyPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MediaObjectMetadataQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find metadata for specific object id in given domain
     
     - parameter domain: (path) The domain of the metadata to find 
     - parameter id: (path) The object id of the multimedia object to find metadata for 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findMetadataByDomain(domain: String, id: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findMetadataByDomainWithRequestBuilder(domain: domain, id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find metadata for specific object id in given domain
     - GET /api/v1/find/metadata/in/{domain}/by/id/{id}
     - Find metadata for specific object id in given domain
     - parameter domain: (path) The domain of the metadata to find 
     - parameter id: (path) The object id of the multimedia object to find metadata for 
     - returns: RequestBuilder<MediaObjectMetadataQueryResult> 
     */
    open class func findMetadataByDomainWithRequestBuilder(domain: String, id: String) -> RequestBuilder<MediaObjectMetadataQueryResult> {
        var localVariablePath = "/api/v1/find/metadata/in/{domain}/by/id/{id}"
        let domainPreEscape = "\(APIHelper.mapValueToPathItem(domain))"
        let domainPostEscape = domainPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{domain}", with: domainPostEscape, options: .literal, range: nil)
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

        let localVariableRequestBuilder: RequestBuilder<MediaObjectMetadataQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find metadata in the specified domain for all the given ids
     
     - parameter domain: (path) The domain of the metadata to find 
     - parameter idList: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findMetadataByDomainBatched(domain: String, idList: IdList? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findMetadataByDomainBatchedWithRequestBuilder(domain: domain, idList: idList).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find metadata in the specified domain for all the given ids
     - POST /api/v1/find/metadata/in/{domain}
     - Find metadata in the specified domain for all the given ids
     - parameter domain: (path) The domain of the metadata to find 
     - parameter idList: (body)  (optional)
     - returns: RequestBuilder<MediaObjectMetadataQueryResult> 
     */
    open class func findMetadataByDomainBatchedWithRequestBuilder(domain: String, idList: IdList? = nil) -> RequestBuilder<MediaObjectMetadataQueryResult> {
        var localVariablePath = "/api/v1/find/metadata/in/{domain}"
        let domainPreEscape = "\(APIHelper.mapValueToPathItem(domain))"
        let domainPostEscape = domainPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{domain}", with: domainPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: idList)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MediaObjectMetadataQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find metadata for a given object id with specified key
     
     - parameter key: (path) The key of the metadata to find 
     - parameter id: (path) The object id of for which the metadata should be find 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findMetadataByKey(key: String, id: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findMetadataByKeyWithRequestBuilder(key: key, id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find metadata for a given object id with specified key
     - GET /api/v1/find/metadata/with/{key}/by/id/{id}
     - Find metadata for a given object id with specified key
     - parameter key: (path) The key of the metadata to find 
     - parameter id: (path) The object id of for which the metadata should be find 
     - returns: RequestBuilder<MediaObjectMetadataQueryResult> 
     */
    open class func findMetadataByKeyWithRequestBuilder(key: String, id: String) -> RequestBuilder<MediaObjectMetadataQueryResult> {
        var localVariablePath = "/api/v1/find/metadata/with/{key}/by/id/{id}"
        let keyPreEscape = "\(APIHelper.mapValueToPathItem(key))"
        let keyPostEscape = keyPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{key}", with: keyPostEscape, options: .literal, range: nil)
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

        let localVariableRequestBuilder: RequestBuilder<MediaObjectMetadataQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find metadata for a given object id with specified key
     
     - parameter key: (path) The key of the metadata to find 
     - parameter idList: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findMetadataByKeyBatched(key: String, idList: IdList? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findMetadataByKeyBatchedWithRequestBuilder(key: key, idList: idList).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find metadata for a given object id with specified key
     - POST /api/v1/find/metadata/with/{key}
     - Find metadata with a the speicifed key from the path across all domains and for the provided ids
     - parameter key: (path) The key of the metadata to find 
     - parameter idList: (body)  (optional)
     - returns: RequestBuilder<MediaObjectMetadataQueryResult> 
     */
    open class func findMetadataByKeyBatchedWithRequestBuilder(key: String, idList: IdList? = nil) -> RequestBuilder<MediaObjectMetadataQueryResult> {
        var localVariablePath = "/api/v1/find/metadata/with/{key}"
        let keyPreEscape = "\(APIHelper.mapValueToPathItem(key))"
        let keyPostEscape = keyPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{key}", with: keyPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: idList)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MediaObjectMetadataQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Finds metadata for the given list of object ids
     
     - parameter optionallyFilteredIdList: (body)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findMetadataForObjectIdBatched(optionallyFilteredIdList: OptionallyFilteredIdList? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: MediaObjectMetadataQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findMetadataForObjectIdBatchedWithRequestBuilder(optionallyFilteredIdList: optionallyFilteredIdList).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Finds metadata for the given list of object ids
     - POST /api/v1/find/metadata/by/id
     - Finds metadata for the given list of object ids
     - parameter optionallyFilteredIdList: (body)  (optional)
     - returns: RequestBuilder<MediaObjectMetadataQueryResult> 
     */
    open class func findMetadataForObjectIdBatchedWithRequestBuilder(optionallyFilteredIdList: OptionallyFilteredIdList? = nil) -> RequestBuilder<MediaObjectMetadataQueryResult> {
        let localVariablePath = "/api/v1/find/metadata/by/id"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: optionallyFilteredIdList)
        dump(optionallyFilteredIdList)
        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<MediaObjectMetadataQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()
        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find features for the given id
     
     - parameter id: (path) The id to find features of 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findSegFeatById(id: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: FeaturesAllCategoriesQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findSegFeatByIdWithRequestBuilder(id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find features for the given id
     - GET /api/v1/find/feature/all/by/id/{id}
     - Find features by the given id
     - parameter id: (path) The id to find features of 
     - returns: RequestBuilder<FeaturesAllCategoriesQueryResult> 
     */
    open class func findSegFeatByIdWithRequestBuilder(id: String) -> RequestBuilder<FeaturesAllCategoriesQueryResult> {
        var localVariablePath = "/api/v1/find/feature/all/by/id/{id}"
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

        let localVariableRequestBuilder: RequestBuilder<FeaturesAllCategoriesQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find metadata for the given segment id
     
     - parameter id: (path) The segment id to find metadata of 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findSegMetaById(id: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: MediaSegmentMetadataQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findSegMetaByIdWithRequestBuilder(id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find metadata for the given segment id
     - GET /api/v1/find/metadata/by/segmentid/{id}
     - Find metadata by the given segment id
     - parameter id: (path) The segment id to find metadata of 
     - returns: RequestBuilder<MediaSegmentMetadataQueryResult> 
     */
    open class func findSegMetaByIdWithRequestBuilder(id: String) -> RequestBuilder<MediaSegmentMetadataQueryResult> {
        var localVariablePath = "/api/v1/find/metadata/by/segmentid/{id}"
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

        let localVariableRequestBuilder: RequestBuilder<MediaSegmentMetadataQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find tag ids for the given id
     
     - parameter id: (path) The id to find tagids of 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findTagInformationById(id: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: TagIDsForElementQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findTagInformationByIdWithRequestBuilder(id: id).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find tag ids for the given id
     - GET /api/v1/find/feature/tags/by/id/{id}
     - Find tag ids for the given id
     - parameter id: (path) The id to find tagids of 
     - returns: RequestBuilder<TagIDsForElementQueryResult> 
     */
    open class func findTagInformationByIdWithRequestBuilder(id: String) -> RequestBuilder<TagIDsForElementQueryResult> {
        var localVariablePath = "/api/v1/find/feature/tags/by/id/{id}"
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

        let localVariableRequestBuilder: RequestBuilder<TagIDsForElementQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Find Text for the given id and retrieval category
     
     - parameter id: (path) The id to find text of 
     - parameter category: (path) The category for which retrieval shall be performed 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func findTextByIDAndCat(id: String, category: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: FeaturesTextCategoryQueryResult?, _ error: Error?) -> Void)) -> RequestTask {
        return findTextByIDAndCatWithRequestBuilder(id: id, category: category).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Find Text for the given id and retrieval category
     - GET /api/v1/find/feature/text/by/{id}/{category}
     - Find Text by the given id and retrieval category
     - parameter id: (path) The id to find text of 
     - parameter category: (path) The category for which retrieval shall be performed 
     - returns: RequestBuilder<FeaturesTextCategoryQueryResult> 
     */
    open class func findTextByIDAndCatWithRequestBuilder(id: String, category: String) -> RequestBuilder<FeaturesTextCategoryQueryResult> {
        var localVariablePath = "/api/v1/find/feature/text/by/{id}/{category}"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let categoryPreEscape = "\(APIHelper.mapValueToPathItem(category))"
        let categoryPostEscape = categoryPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{category}", with: categoryPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<FeaturesTextCategoryQueryResult>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}

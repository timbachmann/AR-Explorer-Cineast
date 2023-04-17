//
// FeaturesAllCategoriesQueryResult.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct FeaturesAllCategoriesQueryResult: Codable, JSONEncodable, Hashable {

    public var queryId: String?
    public var featureMap: [String: [AnyCodable]]?
    public var elementID: String?

    public init(queryId: String? = nil, featureMap: [String: [AnyCodable]]? = nil, elementID: String? = nil) {
        self.queryId = queryId
        self.featureMap = featureMap
        self.elementID = elementID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case queryId
        case featureMap
        case elementID
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(queryId, forKey: .queryId)
        try container.encodeIfPresent(featureMap, forKey: .featureMap)
        try container.encodeIfPresent(elementID, forKey: .elementID)
    }
}

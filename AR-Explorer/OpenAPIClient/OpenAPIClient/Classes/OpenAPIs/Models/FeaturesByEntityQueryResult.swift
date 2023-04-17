//
// FeaturesByEntityQueryResult.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct FeaturesByEntityQueryResult: Codable, JSONEncodable, Hashable {

    public var queryId: String?
    public var featureMap: [[String: AnyCodable]]?
    public var entityName: String?

    public init(queryId: String? = nil, featureMap: [[String: AnyCodable]]? = nil, entityName: String? = nil) {
        self.queryId = queryId
        self.featureMap = featureMap
        self.entityName = entityName
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case queryId
        case featureMap
        case entityName
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(queryId, forKey: .queryId)
        try container.encodeIfPresent(featureMap, forKey: .featureMap)
        try container.encodeIfPresent(entityName, forKey: .entityName)
    }
}

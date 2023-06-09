//
// TagIDsForElementQueryResult.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TagIDsForElementQueryResult: Codable, JSONEncodable, Hashable {

    public var queryId: String?
    public var tags: [String]?
    public var elementID: String?

    public init(queryId: String? = nil, tags: [String]? = nil, elementID: String? = nil) {
        self.queryId = queryId
        self.tags = tags
        self.elementID = elementID
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case queryId
        case tags
        case elementID
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(queryId, forKey: .queryId)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(elementID, forKey: .elementID)
    }
}


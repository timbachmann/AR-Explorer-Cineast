//
// MetadataKeyFilter.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MetadataKeyFilter: Codable, JSONEncodable, Hashable {

    public var keywords: [String]?
    public var type: String

    public init(keywords: [String]? = nil, type: String) {
        self.keywords = keywords
        self.type = type
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case keywords
        case type
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(keywords, forKey: .keywords)
        try container.encode(type, forKey: .type)
    }
}


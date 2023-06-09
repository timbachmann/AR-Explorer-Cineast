//
// Tag.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Tag: Codable, JSONEncodable, Hashable {

    public enum Priority: String, Codable, CaseIterable {
        case request = "REQUEST"
        case require = "REQUIRE"
        case exclude = "EXCLUDE"
    }
    public var name: String?
    public var priority: Priority?
    public var id: String?
    public var description: String?

    public init(name: String? = nil, priority: Priority? = nil, id: String? = nil, description: String? = nil) {
        self.name = name
        self.priority = priority
        self.id = id
        self.description = description
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case priority
        case id
        case description
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(priority, forKey: .priority)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(description, forKey: .description)
    }
}


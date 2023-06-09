//
// QueryTerm.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct QueryTerm: Codable, JSONEncodable, Hashable {

    public enum ModelType: String, Codable, CaseIterable {
        case image = "IMAGE"
        case audio = "AUDIO"
        case model3d = "MODEL3D"
        case location = "LOCATION"
        case parameterisedLocation = "PARAMETERISED_LOCATION"
        case time = "TIME"
        case text = "TEXT"
        case tag = "TAG"
        case semantic = "SEMANTIC"
        case skeleton = "SKELETON"
        case id = "ID"
        case boolean = "BOOLEAN"
    }
    public var categories: [String]
    public var type: ModelType
    public var data: String

    public init(categories: [String], type: ModelType, data: String) {
        self.categories = categories
        self.type = type
        self.data = data
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case categories
        case type
        case data
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(categories, forKey: .categories)
        try container.encode(type, forKey: .type)
        try container.encode(data, forKey: .data)
    }
}


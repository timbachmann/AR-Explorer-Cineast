//
// SelectResult.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SelectResult: Codable, JSONEncodable, Hashable {

    public var columns: [[String: String]]?

    public init(columns: [[String: String]]? = nil) {
        self.columns = columns
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case columns
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(columns, forKey: .columns)
    }
}


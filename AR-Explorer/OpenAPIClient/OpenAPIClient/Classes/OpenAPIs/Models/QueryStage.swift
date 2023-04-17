//
// QueryStage.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct QueryStage: Codable, JSONEncodable, Hashable {

    public var terms: [QueryTerm]

    public init(terms: [QueryTerm]) {
        self.terms = terms
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case terms
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(terms, forKey: .terms)
    }
}

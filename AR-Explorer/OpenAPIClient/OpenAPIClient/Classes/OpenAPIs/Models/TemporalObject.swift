//
// TemporalObject.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TemporalObject: Codable, JSONEncodable, Hashable {

    public var segments: [String]?
    public var objectId: String?
    public var score: Double?

    public init(segments: [String]? = nil, objectId: String? = nil, score: Double? = nil) {
        self.segments = segments
        self.objectId = objectId
        self.score = score
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case segments
        case objectId
        case score
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(segments, forKey: .segments)
        try container.encodeIfPresent(objectId, forKey: .objectId)
        try container.encodeIfPresent(score, forKey: .score)
    }
}


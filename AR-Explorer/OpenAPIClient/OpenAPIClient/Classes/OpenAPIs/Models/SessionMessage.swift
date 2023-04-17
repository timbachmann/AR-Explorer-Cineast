//
// SessionMessage.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SessionMessage: Codable, JSONEncodable, Hashable {

    public enum MessageType: String, Codable, CaseIterable {
        case ping = "PING"
        case qSim = "Q_SIM"
        case qMlt = "Q_MLT"
        case qNeseg = "Q_NESEG"
        case qSeg = "Q_SEG"
        case qTemporal = "Q_TEMPORAL"
        case sessionInfo = "SESSION_INFO"
        case qrStart = "QR_START"
        case qrEnd = "QR_END"
        case qrError = "QR_ERROR"
        case qrObject = "QR_OBJECT"
        case qrMetadataO = "QR_METADATA_O"
        case qrMetadataS = "QR_METADATA_S"
        case qrSegment = "QR_SEGMENT"
        case qrSimilarity = "QR_SIMILARITY"
        case qrTemporal = "QR_TEMPORAL"
    }
    public var message: String?
    public var messageType: MessageType?

    public init(message: String? = nil, messageType: MessageType? = nil) {
        self.message = message
        self.messageType = messageType
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case message
        case messageType
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(message, forKey: .message)
        try container.encodeIfPresent(messageType, forKey: .messageType)
    }
}


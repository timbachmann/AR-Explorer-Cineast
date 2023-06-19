//
//  QueryVariables.swift
//  AR-Explorer
//
//  Created by Tim Bachmann on 19.04.23.
//

import Foundation

#if canImport(AnyCodable)
import AnyCodable
#endif

public struct QueryVariables: Codable, JSONEncodable, Hashable {
    

    public var radius: Double
    public var startDate: Date
    public var endDate: Date
    public var queryText: String
    public var includeDate: Bool
    public var includeRadius: Bool
    public var includeText: Bool
    public var includeExample: Bool
    public var lat: Double
    public var lng: Double

    public init(radius: Double, startDate: Date, endDate: Date, queryText: String, includeDate: Bool, includeRadius: Bool, includeText: Bool, includeExample: Bool, lat: Double, lng: Double) {
        self.radius = radius
        self.startDate = startDate
        self.endDate = endDate
        self.queryText = queryText
        self.includeDate = includeDate
        self.includeRadius = includeRadius
        self.includeText = includeText
        self.includeExample = includeExample
        self.lat = lat
        self.lng = lng
    }
}

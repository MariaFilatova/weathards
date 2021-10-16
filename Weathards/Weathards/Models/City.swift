//
//  City.swift
//  Weathards
//
//  Created by Waind Storm on 15.10.21.
//

import Foundation

public struct Cities: Codable {
    var cities: [City]
}

public struct City: Identifiable {
    public var id: UUID = UUID()
    var name: String
    var country: String
    
    public init(name: String,
                country: String) {
        self.name = name
        self.country = country
    }
}


// MARK: - Codable

extension City: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case country
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        country = try values.decode(String.self, forKey: .country)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(country, forKey: .country)
    }
}

// MARK: - Equatable

extension City: Equatable {
    public static func ==(lhs: City, rhs: City) -> Bool {
        return lhs.name == rhs.name
        && lhs.country == rhs.country
    }
}

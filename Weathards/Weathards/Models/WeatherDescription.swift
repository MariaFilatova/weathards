//
//  WeatherDescription.swift
//  WeatherApp
//
//  Created by Waind Storm on 24.09.21.
//

import Foundation


public struct WeatherDescription {
    /// Description Id.
    var id: Int
    /// Name of group - one  word of short description for the weather (for example Rain or Dust).
    var group: WeatherGroup
    /// Detailed info about weather, contains several words.
    var description: String
    
    public init(id: Int,
                group: WeatherGroup,
                description: String) {
        self.id = id
        self.group = group
        self.description = description
    }
}

// MARK: - Codable

extension WeatherDescription: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case group = "main"
        case description
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        
        let groupName = try values.decode(String.self, forKey: .group)
        group = WeatherGroup.init(rawValue: groupName) ?? .clearSky
        
        description = try values.decode(String.self, forKey: .description)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(group.rawValue, forKey: .group)
        try container.encode(description, forKey: .description)
    }
}

// MARK: - Equatable

extension WeatherDescription: Equatable {
    public static func ==(lhs: WeatherDescription, rhs: WeatherDescription) -> Bool {
        return lhs.id == rhs.id
            && lhs.group == rhs.group
            && lhs.description == rhs.description
    }
}

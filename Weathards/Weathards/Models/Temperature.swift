//
//  Temperature.swift
//  WeatherApp
//
//  Created by Waind Storm on 24.09.21.
//

import Foundation

public struct Temperature {
    /// Day temperature.
    var day: Double
    /// Night temperature.
    var night: Double
    /// Min daily temperature.
    var min: Double
    /// Max daily temperature.
    var max: Double
    
    public init(day: Double,
                night: Double,
                min: Double,
                max: Double) {
        self.day = day
        self.night = night
        self.min = min
        self.max = max
    }
}

// MARK: - Codable

extension Temperature: Codable {
    enum CodingKeys: String, CodingKey {
        case day
        case night
        case min
        case max
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        day = try values.decode(Double.self, forKey: .day).round(to: 1)
        night = try values.decode(Double.self, forKey: .night).round(to: 1)
        min = try values.decode(Double.self, forKey: .min).round(to: 1)
        max = try values.decode(Double.self, forKey: .max).round(to: 1)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(day, forKey: .day)
        try container.encode(night, forKey: .night)
        try container.encode(min, forKey: .min)
        try container.encode(max, forKey: .max)
    }
}

// MARK: - Equatable

extension Temperature: Equatable {
    public static func ==(lhs: Temperature, rhs: Temperature) -> Bool {
        return lhs.day == rhs.day
            && lhs.night == rhs.night
            && lhs.min == rhs.min
            && lhs.max == rhs.max
    }
}

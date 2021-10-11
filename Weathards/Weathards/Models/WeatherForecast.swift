//
//  WeatherForecast.swift
//  WeatherApp
//
//  Created by Waind Storm on 24.09.21.
//

import Foundation

/// Main object that is retrieved from server.
public struct WeatherForecast {
    /// Current weather data.
    var current: Weather?
    /// Hourly forecast weather data (next 48 hours).
    var hourly: [Weather]?
    /// Daily forecast weather data (next 7 days).
    var daily: [DailyWeather]?
    
    public init(current: Weather?,
                hourly: [Weather]?,
                daily: [DailyWeather]?) {
        self.current = current
        self.hourly = hourly
        self.daily = daily
    }
}

// MARK: - Codable

extension WeatherForecast: Codable {
    enum CodingKeys: String, CodingKey {
        case current
        case hourly
        case daily
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        current = try values.decode(Weather?.self, forKey: .current)
        hourly = try values.decode([Weather]?.self, forKey: .hourly)
        daily = try values.decode([DailyWeather]?.self, forKey: .daily)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(current, forKey: .current)
        try container.encode(hourly, forKey: .hourly)
        try container.encode(daily, forKey: .daily)
    }
}

// MARK: - Equatable

extension WeatherForecast: Equatable {
    public static func ==(lhs: WeatherForecast, rhs: WeatherForecast) -> Bool {
        return lhs.current == rhs.current
            && lhs.hourly == rhs.hourly
            && lhs.daily == rhs.daily
    }
}

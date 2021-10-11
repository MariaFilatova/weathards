//
//  DailyWeather.swift
//  WeatherApp
//
//  Created by Waind Storm on 24.09.21.
//

import Foundation

public struct DailyWeather {
    /// DateTime interval.
    var dateTimeInterval: Int
    var temperature: Temperature
    var weatherDescription: WeatherDescription
    
    var date: Date {
        return Date(timeIntervalSince1970: TimeInterval(dateTimeInterval))
    }
    
    public init(dateTimeInterval: Int,
                temperature: Temperature,
                weatherDescription: WeatherDescription) {
        self.dateTimeInterval = dateTimeInterval
        self.temperature = temperature
        self.weatherDescription = weatherDescription
    }
}

// MARK: - Codable

extension DailyWeather: Codable {
    enum CodingKeys: String, CodingKey {
        case dateTimeInterval = "dt"
        case temperature = "temp"
        case weatherDescription = "weather"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dateTimeInterval = try values.decode(Int.self, forKey: .dateTimeInterval)
        temperature = try values.decode(Temperature.self, forKey: .temperature)
        
        let weatherDescriptionArray = try values.decode([WeatherDescription].self, forKey: .weatherDescription)
        guard
            let value = weatherDescriptionArray.first else {
            let context = DecodingError.Context(codingPath: [CodingKeys.weatherDescription], debugDescription: "Array is empty")
            throw DecodingError.valueNotFound(DailyWeather.self, context)
        }
        weatherDescription = value
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dateTimeInterval, forKey: .dateTimeInterval)
        try container.encode(temperature, forKey: .temperature)
        try container.encode([weatherDescription], forKey: .weatherDescription)
    }
}

// MARK: - Equatable

extension DailyWeather: Equatable {
    public static func ==(lhs: DailyWeather, rhs: DailyWeather) -> Bool {
        return lhs.dateTimeInterval == rhs.dateTimeInterval
            && lhs.temperature == rhs.temperature
            && lhs.weatherDescription == rhs.weatherDescription
    }
}

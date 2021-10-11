//
//  Weather.swift
//  WeatherApp
//
//  Created by Waind Storm on 24.09.21.
//

import Foundation

public struct Weather {
    var dateTimeInterval: Int?
    var temperature: Double
    /// This temperature parameter accounts for the human perception of weather.
    var feelsLike: Double
    /// Humidity, %.
    var humidity: Int
    /// Wind speed, metre/sec.
    var windSpeed: Double
    var weatherDescription: WeatherDescription
    
    var date: Date {
        guard let dateTimeInterval = dateTimeInterval else { return Date() }
        return Date(timeIntervalSince1970: TimeInterval(dateTimeInterval))
    }
    
    public init(dateTimeInterval: Int,
                temperature: Double,
                feelsLike: Double,
                humidity: Int,
                windSpeed: Double,
                weatherDescription: WeatherDescription) {
        self.dateTimeInterval = dateTimeInterval
        self.temperature = temperature
        self.feelsLike = feelsLike
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.weatherDescription = weatherDescription
    }
}

// MARK: - Codable

extension Weather: Codable {
    enum CodingKeys: String, CodingKey {
        case dateTimeInterval = "dt"
        case temperature = "temp"
        case feelsLike = "feels_like"
        case humidity
        case windSpeed = "wind_speed"
        case weatherDescriptionArray = "weather"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        dateTimeInterval = try values.decode(Int.self, forKey: .dateTimeInterval)
        temperature = try values.decode(Double.self, forKey: .temperature).round(to: 1)
        feelsLike = try values.decode(Double.self, forKey: .feelsLike).round(to: 1)
        humidity = try values.decode(Int.self, forKey: .humidity)
        windSpeed = try values.decode(Double.self, forKey: .windSpeed).round(to: DECIMALS_NUMBER)
        
        let weatherDescriptionArray = try values.decode([WeatherDescription].self, forKey: .weatherDescriptionArray)
        guard
            let value = weatherDescriptionArray.first else {
            let context = DecodingError.Context(codingPath: [CodingKeys.weatherDescriptionArray], debugDescription: "Array is empty")
            throw DecodingError.valueNotFound(DailyWeather.self, context)
        }
        weatherDescription = value
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(date, forKey: .dateTimeInterval)
        try container.encode(temperature, forKey: .temperature)
        try container.encode(feelsLike, forKey: .feelsLike)
        try container.encode(humidity, forKey: .humidity)
        try container.encode(windSpeed, forKey: .windSpeed)
        try container.encode([weatherDescription], forKey: .weatherDescriptionArray)
    }
}

// MARK: - Equatable

extension Weather: Equatable {
    public static func ==(lhs: Weather, rhs: Weather) -> Bool {
        return lhs.dateTimeInterval == rhs.dateTimeInterval
            && lhs.temperature == rhs.temperature
            && lhs.feelsLike == rhs.feelsLike
            && lhs.humidity == rhs.humidity
            && lhs.windSpeed == rhs.windSpeed
            && lhs.weatherDescription == rhs.weatherDescription
    }
}

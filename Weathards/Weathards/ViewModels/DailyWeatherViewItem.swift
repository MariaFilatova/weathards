//
//  DailyWeatherViewItem.swift
//  WeatherApp
//
//  Created by Waind Storm on 1.10.21.
//

import Foundation

final class DailyWeatherViewItem: Identifiable {
    
    var dailyWeather: DailyWeather?
    
    var dayOfWeekName: String {
        guard let date = dailyWeather?.date else { return "" }
        let test = DateFormatterManager.shared.dateFormatter(for: .fullNameDayOfWeek).string(from: date)
        return test
    }
    
    var iconName: String {
        guard let icon = dailyWeather?.weatherDescription.group.iconName else { return "icon undefined" }
        return icon
    }
    
    var displayTemperature: String {
        guard let temperature = dailyWeather?.temperature.day else { return "--.-" }
        return "\(temperature)\(temperatureMeasureString)"
    }
    
    init(dailyWeather: DailyWeather?) {
        self.dailyWeather = dailyWeather
    }
}

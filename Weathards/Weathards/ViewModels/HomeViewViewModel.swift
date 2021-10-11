//
//  HomeViewViewModel.swift
//  WeatherApp
//
//  Created by Waind Storm on 24.09.21.
//

import Foundation
import SwiftUI
import CoreLocation

final class HomeViewViewModel: ObservableObject {
    @Published var weather: WeatherForecast = WeatherForecast(current: nil, hourly: nil, daily: nil)
    @Published var appearance: Appearance = .cloudsSummerDay
    
    @Published var city: String = "Minsk"
        // TODO: read saved city from user defaults
    
    
    var statusBarHeight: CGFloat {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    var showWarning: Bool = false
    
    init() {
        //showWarning = LocationService.shared.checkLocationServicesEnabled()
        fetchWeather()
    }
    
    var date: String {
        guard let date = weather.current?.date else { return "Loading..." }
        return DateFormatterManager.shared.dateFormatter(for: .shortWeekdayAndFullDate).string(from: date)
    }

    var dayTemperature: String {
        guard let temperature = weather.current?.temperature else { return ""}
        return "\(String(temperature))°C"
    }
    
    var weatherDescription: String {
        guard let description = weather.current?.weatherDescription.group else { return "" }
        return description.rawValue
    }
    
    var dailyWeather: [DailyWeatherViewItem] {
        var result = [DailyWeatherViewItem]()
        if let dailyWeather = weather.daily {
            for item in dailyWeather {
                result.append(DailyWeatherViewItem(dailyWeather: item))
            }
            // API returns today's daily weather as first element. We don't want to show today's weather in forecast.
            result.removeFirst()
        }
        return result
    }
    
    private func getAppearanceFor(_ weather: WeatherDescription, date: Date) -> Appearance {
        let hour = Calendar.current.component(.hour, from: date)
        let weatherGroup = weather.group
        
        switch (hour, weatherGroup) {
        case (6...18, .clearSky):
            return .clearSkySummerDay
        case (0...6, .clearSky),
             (18...24, .clearSky):
            return .clearSkySummerNight
        default:
            return .cloudsSummerDay
        }
    }
}


// MARK: - fetching weather

extension HomeViewViewModel {
    private func fetchWeather() {
        LocationService.shared.getLocationFor(city: "Minsk") { [weak self] lat, lon in
            OpenWeatherService.shared.getWeatherFor(lat: lat, lon: lon) { result, error in
                DispatchQueue.main.async {
                    if
                        let self = self,
                        let weather = result,
                        let current = weather.current {
                        self.weather = weather
                        self.appearance = self.getAppearanceFor(current.weatherDescription, date: current.date)
                    }
                }
            }
        }
    }
}

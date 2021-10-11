//
//  WeatherGroup.swift
//  WeatherApp
//
//  Created by Waind Storm on 1.10.21.
//

import Foundation

public enum WeatherGroup: String, CaseIterable {
    case thunderstorm = "Thunderstorm"
    case drizzle = "Drizzle"
    case rain = "Rain"
    case snow = "Snow"
    case mist = "Mist"
    case smoke = "Smoke"
    case haze = "Haze"
    case dust = "Dust"
    case fog = "Fog"
    case sand = "Sand"
    case ash = "Ash"
    case squall = "Squall"
    case tornado = "Tornado"
    case clearSky = "Clear"
    case clouds = "Clouds"
    
    var iconName: String {
        switch self {
        case .thunderstorm: return "icon thunderstorm"
        case .drizzle: return "icon drizzle"
        case .rain: return "icon rain"
        case .snow: return "icon snow"
        case .mist,
             .smoke,
             .haze,
             .dust,
             .fog,
             .sand,
             .ash,
             .squall,
             .tornado: return "icon mist"
        case .clearSky: return "icon clear sky"
        case .clouds: return "icon clouds"
        }
    }
}

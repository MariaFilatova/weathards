//
//  AppearanceHelper.swift
//  WeatherApp
//
//  Created by Waind Storm on 7.10.21.
//

import Foundation
import  SwiftUI

enum Appearance {
    case clearSkySummerDay
    case clearSkySummerNight
    case clearSkyWinterDay
    case clearSkyWinterNight
    case rainDay
    case rainNight
    case snowDay
    case snowNight
    case thunderstorm
    case cloudsSummerDay
    case cloudsSummerNight
    case fogDay
    case fogNight
    case mistDay
    case mistNight
    
    var theme: (background: String, color: Color, textColor: Color) {
        switch self {
        case .clearSkySummerDay:
            return ("dawn_clearSky", Color.black.opacity(0.3), .white)
         case .clearSkySummerNight,
             .clearSkyWinterDay,
             .clearSkyWinterNight:
            return ("night_alt_clearSky", Color.black.opacity(0.3), .white)
        case .rainDay,
             .rainNight:
            return ("rain_night", Color.white.opacity(0.3), .white)
        case .snowDay:
            return ("snow_day", Color.white.opacity(0.3), .white)
        case .snowNight:
            return ("snow_night", Color.white.opacity(0.3), .white)
        case .thunderstorm:
            return ("night_alt_clearSky", Color.black.opacity(0.3), .white)
        case .cloudsSummerDay:
            return ("clouds_day", Color.black.opacity(0.3), .white)
        case .cloudsSummerNight:
            return ("night_clearSky", Color.black.opacity(0.3), .white)
        case .fogDay,
             .fogNight:
            return ("night_fog", Color.white.opacity(0.3), .white)
        case .mistDay:
            return ("mist_day", Color.white.opacity(0.3), .white)
        case .mistNight:
            return ("mist_night", Color.white.opacity(0.3), .white)
        }
    }
    
   
}

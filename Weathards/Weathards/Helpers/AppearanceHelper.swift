//
//  AppearanceHelper.swift
//  WeatherApp
//
//  Created by Waind Storm on 7.10.21.
//

import Foundation
import SwiftUI

struct Theme {
    /// Name of background image
    var background: String
    /// Background color of elements on home screen
    var color: Color
    /// Text color
    var textColor: Color
    /// Color of icons on home screen
    var iconColor: Color
}

enum Appearance {
    // TODO: add undefined case (when not loaded)
    case clearSkySummerDay
    case clearSkySummerNight
    case clearSkyWinterDay
    case clearSkyWinterNight
    case rainDay
    case rainNight
    case snowDay
    case snowNight
    case thunderstorm
    case cloudsDay
    case cloudsNight
    case fogDay
    case fogNight
    case mistDay
    case mistNight
    
    var theme: Theme {
        switch self {
        case .clearSkySummerDay:
            return Theme(background: (["clear sky day alt", "clear sky day"].randomElement()) ?? "clear sky day alt",
                         color: Color.black.opacity(0.3),
                         textColor: .white,
                         iconColor: .white)
        case .clearSkySummerNight:
            return Theme(background: (["clear sky night alt", "clear night day"].randomElement()) ?? "clear sky night alt",
                         color: Color.black.opacity(0.3),
                         textColor: .white,
                         iconColor: .white)
        case .clearSkyWinterDay,
                .clearSkyWinterNight:
            return Theme(background: "clear sky night",
                         color: Color.black.opacity(0.3),
                         textColor: .white,
                         iconColor: .white)
        case .rainDay,
                .rainNight:
            return Theme(background: "rain night",
                         color: Color.white.opacity(0.3),
                         textColor: .white,
                         iconColor: .white)
        case .snowDay:
            return Theme(background: "snow day",
                         color: Color.black.opacity(0.3),
                         textColor: .white,
                         iconColor: .white)
        case .snowNight:
            return Theme(background: "snow night",
                         color: Color.black.opacity(0.3),
                         textColor: .white,
                         iconColor: .white)
        case .thunderstorm:
            return Theme(background: "thunderstorm day",
                         color: Color.black.opacity(0.3),
                         textColor: .white,
                         iconColor: .white)
        case .cloudsDay:
            return Theme(background: "clouds day",
                         color: Color.black.opacity(0.5),
                         textColor: .white,
                         iconColor: .black)
        case .cloudsNight:
            return Theme(background: "clear sky night alt",
                         color: Color.black.opacity(0.3),
                         textColor: .white,
                         iconColor: .white)
        case .fogDay,
                .fogNight:
            return Theme(background: "fog night",
                         color: Color.black.opacity(0.3),
                         textColor: .white,
                         iconColor: .white)
        case .mistDay:
            return Theme(background: "mist day",
                         color: Color.black.opacity(0.3),
                         textColor: .white,
                         iconColor: .white)
        case .mistNight:
            return Theme(background: "mist night",
                         color: Color.black.opacity(0.3),
                         textColor: .white,
                         iconColor: .white)
        }
    }
    
    static func getAppearanceFor(_ weather: WeatherDescription, date: Date) -> Appearance {
        let hour = Calendar.current.component(.hour, from: date)
        let weatherGroup = weather.group
        
        switch (hour, weatherGroup) {
        case (6...18, .clearSky):
            return .clearSkySummerDay
        case (0...6, .clearSky),
            (18...24, .clearSky):
            return .clearSkySummerNight
        case (0...6, .clouds),
            (18...24, .clouds):
            return .cloudsNight
        default:
            return .cloudsDay
        }
    }
}

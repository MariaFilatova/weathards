//
//  Font+WeatherApp.swift
//  WeatherApp
//
//  Created by Waind Storm on 9.10.21.
//

import Foundation
import SwiftUI

extension Font {
    private enum Poppins: String {
        case black = "Poppins-Black"
        case bold = "Poppins-Bold"
        case extraBold = "Poppins-ExtraBold"
        case extraLight = "Poppins-ExtraLight"
        case light = "Poppins-Light"
        case medium = "Poppins-Medium"
        case regular = "Poppins-Regular"
        case semiBold = "Poppins-SemiBold"
        case thin = "Poppins-Thin"
    }

    /// Weight: black, size: 40
    static let headline: Font = .custom(Poppins.black.rawValue, size: 40)
    /// Weight: semibold, size: 20
    static let title: Font = .custom(Poppins.semiBold.rawValue, size: 26)
    /// Weight: medium, size: 18
    static let subtitle: Font = .custom(Poppins.medium.rawValue, size: 18)
    /// Weight: regular, size: 16
    static let body: Font = .custom(Poppins.regular.rawValue, size: 16)
    /// Weight: medium, size: 16
    static let bodyMedium: Font = .custom(Poppins.medium.rawValue, size: 16)
    /// Weight: semibold, size: 16
    static let forecastText: Font = .custom(Poppins.semiBold.rawValue, size: 16)
    /// Weight: regular, size: 12
    static let tinyText: Font = .custom(Poppins.regular.rawValue, size: 12)
}

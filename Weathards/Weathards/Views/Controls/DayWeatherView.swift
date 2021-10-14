//
//  DayWeatherView.swift
//  WeatherApp
//
//  Created by Waind Storm on 1.10.21.
//

import SwiftUI

struct DayWeatherView: View {
    var dayOfWeek: String
    var iconName: String
    var temperature: String
    var appearance: Appearance
    
    var body: some View {
        VStack(spacing: 16) {
            DateText(text: dayOfWeek, textColor: appearance.theme.textColor)
                .padding(EdgeInsets(top: 16, leading: 8, bottom: 0, trailing: 8))
            WeatherIconView(iconName: iconName)
                .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
            ForecastText(text: temperature, textColor: appearance.theme.textColor)
                .padding(EdgeInsets(top: 0, leading: 6, bottom: 16, trailing: 6))
        }
        .frame(minWidth: 120, idealWidth: 120, maxWidth: 120)
        .background(appearance.theme.color)
        .cornerRadius(8)
    }
}

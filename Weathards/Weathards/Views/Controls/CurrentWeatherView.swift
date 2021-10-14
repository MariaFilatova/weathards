//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Waind Storm on 1.10.21.
//

import SwiftUI

struct CurrentWeatherView: View {
    var weatherDescription: String
    var dayTemperature: String
    var city: String
    var date: String
    var appearance: Appearance
    
    var body: some View {
        VStack(spacing: 6) {
            TitleText(text: weatherDescription, textColor: appearance.theme.textColor)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            HeadlineText(text: dayTemperature, textColor: appearance.theme.textColor)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            SubtitleText(text: city, textColor: appearance.theme.textColor)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            DateText(text: date, textColor: appearance.theme.textColor)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
        }
        .background(appearance.theme.color)
        .cornerRadius(15)
    }
}

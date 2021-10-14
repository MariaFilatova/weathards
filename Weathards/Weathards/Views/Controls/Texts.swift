//
//  Texts.swift
//  WeatherApp
//
//  Created by Waind Storm on 7.10.21.
//

import Foundation
import SwiftUI

struct HeadlineText: View {
    var text: String
    var textColor: Color
    
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(.headline)
    }
}

struct TitleText: View {
    var text: String
    var textColor: Color
    
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(.title)
    }
}

struct SubtitleText: View {
    var text: String
    var textColor: Color
    
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(.subtitle)
    }
}

struct BodyText: View {
    var text: String
    var textColor: Color
    
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(.body)
    }
}

struct DateText: View {
    var text: String
    var textColor: Color
    
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(.bodyMedium)
    }
}

struct ForecastText: View {
    var text: String
    var textColor: Color
    
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(.forecastText)
    }
}

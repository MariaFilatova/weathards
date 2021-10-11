//
//  SettingsView.swift
//  WeatherApp
//
//  Created by Waind Storm on 9.10.21.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    //@StateObject var viewModel = SettingsViewViewModel()
    
    var body: some View {
        ZStack {
            Color.accentColor.edgesIgnoringSafeArea(.all)
            VStack {
                TitleText(text: "Settings", textColor: .white)
                    .padding()
                HStack {
                    BodyText(text: "City", textColor: .white)
                    Spacer()
                    BodyText(text: "Minsk", textColor: .gray)
                }
                Divider()
                HStack {
                    BodyText(text: "Measurements", textColor: .white)
                    Spacer()
                    BodyText(text: "°C", textColor: .gray)
                }
                Divider()
                Spacer()
            }
            .padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

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
    @State private var showCitySearch = false
    @StateObject var viewModel = SettingsViewViewModel()
    var appearance: Appearance
    @State private var selectedDegeree = "°C"
    var degrees = ["°C", "°F"]
    @State private var selectedWindSpeed = "m/s"
    var windSpeed = ["km/h", "m/s"]
    
    var body: some View {
            VStack {
                ZStack {
                    Image("city")
                        .resizable()
                        .scaledToFill()
                    Color.black.opacity(0.8)
                    HStack {
                        HeadlineText(text: "City", textColor: .white).padding()
                        TitleText(text: viewModel.city, textColor: .gray).padding()
                        Button(action: { self.showCitySearch.toggle() } ) {
                            Image("search")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }.padding()
                        .sheet(isPresented: $showCitySearch) { CitySelectionView() }
                        
                    }
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(15)
                }
                .frame(width: UIScreen.main.bounds.size.width, height: 300)
                .cornerRadius(15)
                HStack(spacing: 8) {
                    SubtitleText(text: "Degrees", textColor: .white)
                        .padding(EdgeInsets(top: 6, leading: 24, bottom: 6, trailing: 24))
                    Spacer()
                    Picker("Degrees", selection: $selectedDegeree) {
                        ForEach(degrees, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    .frame(width: 160)
                    .colorMultiply(.gray)
                    .colorInvert()
                }
                .background(Color.gray.opacity(0.15))
                .cornerRadius(15)
                .padding()
                HStack(spacing: 8) {
                    SubtitleText(text: "Wind Speed", textColor: .white)
                        .padding(EdgeInsets(top: 6, leading: 24, bottom: 6, trailing: 24))
                    Spacer()
                    Picker("Wind Speed", selection: $selectedWindSpeed) {
                        ForEach(windSpeed, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    .frame(width: 160)
                    .colorMultiply(.gray)
                    .colorInvert()
                }
                .background(Color.gray.opacity(0.15))
                .cornerRadius(15)
                .padding()
                Spacer()
            }
            // TODO: add color for current appearance
            .background(Color.black)
            .ignoresSafeArea(.all, edges: .all)
        }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(appearance: .fogDay)
    }
}

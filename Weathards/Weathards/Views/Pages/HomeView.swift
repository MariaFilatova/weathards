//
//  HomeView.swift
//  WeatherApp
//
//  Created by Waind Storm on 20.09.21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewViewModel()
    @State private var showSettings = false
    
    var body: some View {
        ZStack {
            BackgroundImageView(imageName: viewModel.appearance.theme.background)
            VStack {
                HStack(alignment: .top) {
                    CurrentWeatherView(weatherDescription: viewModel.weatherDescription,
                                       dayTemperature: viewModel.dayTemperature,
                                       city: viewModel.city,
                                       date: viewModel.date,
                                       appearance: viewModel.appearance)
                        .padding(EdgeInsets(top: viewModel.statusBarHeight + 20,
                                            leading: 40,
                                            bottom: 0,
                                            trailing: 0))
                    Spacer()
                    VStack(spacing: 16) {
                        Button(action: { self.showSettings.toggle() } ) {
                            Image("settings")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .sheet(isPresented: $showSettings) { SettingsView() }
                        Button(action: { self.showSettings.toggle() } ) {
                            Image("award")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .sheet(isPresented: $showSettings) { SettingsView() }
                    }
                    .padding(EdgeInsets(top: viewModel.statusBarHeight + 16,
                                        leading: 0,
                                        bottom: 0,
                                        trailing: 16))
                }
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(viewModel.dailyWeather) { day in
                            DayWeatherView(dayOfWeek: day.dayOfWeekName,
                                           iconName: day.iconName,
                                           temperature: day.displayTemperature,
                                           appearance: viewModel.appearance)
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

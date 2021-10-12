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
    @State private var animate = false
    @State private var endSplash = false
    
    var body: some View {
        ZStack {
            
            // Home View content
            ZStack {
                BackgroundImageView(imageName: viewModel.appearance.theme.background)
                VStack {
                    HStack(alignment: .top) {
                        CurrentWeatherView(weatherDescription: viewModel.weatherDescription,
                                           dayTemperature: viewModel.dayTemperature,
                                           city: viewModel.city,
                                           date: viewModel.date,
                                           appearance: viewModel.appearance)
                            .padding(EdgeInsets(top: UIHelper.statusBarHeight() + 20,
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
                        .padding(EdgeInsets(top: UIHelper.statusBarHeight() + 16,
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
            
            // Launch screen and spinner
            ZStack {
                Color(red: 0.043, green: 0.106, blue: 0.204, opacity: 1)
                Image("launch logo")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 400, height: animate ? nil : 400)
                    .scaleEffect(animate ? 3 : 1)
                    .frame(width: UIScreen.main.bounds.width)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            .ignoresSafeArea(.all, edges: .all)
            .onReceive(viewModel.$isLoading, perform: { isLoading in
                animateSplashIf(loadingEnded: !isLoading)
            })
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplashIf(loadingEnded: Bool) {
        if loadingEnded {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                
                withAnimation(Animation.easeOut(duration: 0.45)) {
                    animate.toggle()
                }
                
                withAnimation(Animation.easeOut(duration: 0.35)) {
                    endSplash.toggle()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

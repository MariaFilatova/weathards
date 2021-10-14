//
//  Images.swift
//  WeatherApp
//
//  Created by Waind Storm on 9.10.21.
//

import Foundation
import SwiftUI

struct WeatherIconView: View {
    var iconName: String
    var iconColor: Color = .yellow
    
    var body: some View {
        Image(iconName)
            .resizable()
            .foregroundColor(.yellow)
            .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct BackgroundImageView: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            .edgesIgnoringSafeArea(.all)
    }
}

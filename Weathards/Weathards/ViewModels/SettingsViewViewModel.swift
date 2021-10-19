//
//  SettingsViewViewModel.swift
//  Weathards
//
//  Created by Waind Storm on 14.10.21.
//

import SwiftUI
import CoreLocation

final class SettingsViewViewModel: ObservableObject {
    @Published var city: String
    
    init() {
        city = UserDefaulsService.shared.getCity()
    }
}

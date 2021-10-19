//
//  CitySelectionViewModel.swift
//  Weathards
//
//  Created by Waind Storm on 15.10.21.
//

import Foundation

final class CitySelectionViewModel: ObservableObject {
    @Published var cityList: [City]
    @Published var selectedCity: City {
        didSet {
            UserDefaulsService.shared.saveCity(name: selectedCity.name)
        }
    }
    
    init() {
        cityList = JSONReaderService.shared.getCities()
        selectedCity = JSONReaderService.shared.getCities().filter { $0.name == UserDefaulsService.shared.getCity() }.first ?? City(name: "Minsk", country: "Belarus")
    }
}

//
//  CitySelectionViewModel.swift
//  Weathards
//
//  Created by Waind Storm on 15.10.21.
//

import Foundation

final class CitySelectionViewModel: ObservableObject {
    @Published var cityList: [City]
    
    init() {
        cityList = JSONReaderService.shared.getCities()
    }
}

//
//  CitySelectionViewModel.swift
//  Weathards
//
//  Created by Waind Storm on 15.10.21.
//

import Foundation

final class CitySelectionViewModel: ObservableObject {
    @Published var cityList: [City] = [City(name: "Minsk", country: "Belarus"),
                                       City(name: "Los Angeles", country: "USA"),
                                       City(name: "New York", country: "USA"),
                                       City(name: "Paris", country: "France"),
                                       City(name: "London", country: "United Kindom"),
                                       City(name: "Madrid", country: "Spain"),
                                       City(name: "Rome", country: "Italy"),
                                       City(name: "Milan", country: "Italy"),
                                       City(name: "Sofia", country: "Bulgaria"),
                                       City(name: "Vilnus", country: "Lithuania"),
                                       City(name: "Kiev", country: "Ukrain")]
    
    // TODO: read list of cities from file
}

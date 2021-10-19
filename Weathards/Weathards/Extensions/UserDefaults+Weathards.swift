//
//  UserDefaults+Weathards.swift
//  Weathards
//
//  Created by Waind Storm on 19.10.21.
//

import Foundation

extension UserDefaults {
    struct Key: RawRepresentable, Hashable {
        let rawValue: String
        
        // App Settings
        static let city: Self = "city"
        static let temperatureMeasurement: Self = "temperatureMeasurement"
        static let windMeasurement: Self = "windMeasurement"
    }
}

extension UserDefaults.Key: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
}

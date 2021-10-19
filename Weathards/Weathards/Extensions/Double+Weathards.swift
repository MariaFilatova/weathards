//
//  Double+Weathards.swift
//  WeatherApp
//
//  Created by Waind Storm on 26.09.21.
//

import Foundation

extension Double {
    /// This function left specified number of decimals.
    ///
    /// - Parameters:
    ///   - places: indicats how many symbols should be saved after comma.
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

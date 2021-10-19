//
//  UserDefaulsService.swift
//  Weathards
//
//  Created by Waind Storm on 19.10.21.
//

import Foundation

final class UserDefaulsService {
    static var shared: UserDefaulsService = UserDefaulsService()
    private let storage: UserDefaults = UserDefaults.standard
    
    typealias Key = UserDefaults.Key
    
    func saveCity(name: String) {
        storage.set(name, forKey: Key.city.rawValue )
    }
    
    func getCity() -> String {
        storage.string(forKey: Key.city.rawValue) ?? "Minsk"
    }
}

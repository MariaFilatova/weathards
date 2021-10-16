//
//  JSONReaderService.swift
//  Weathards
//
//  Created by Waind Storm on 16.10.21.
//

import Foundation

class JSONReaderService {
    static var shared: JSONReaderService = JSONReaderService()
    
    private func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if
                let bundlePath = Bundle.main.path(forResource: name, ofType: "json") {
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
                return jsonData
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    private func parse(jsonData: Data) -> Cities? {
        do {
            let decodedData = try JSONDecoder().decode(Cities.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func getCities() -> [City] {
        let jsonData = readLocalJSONFile(forName: "cities")
        if let data = jsonData {
            if let cities = parse(jsonData: data) {
                return cities.cities
            }
        }
        return []
    }
}

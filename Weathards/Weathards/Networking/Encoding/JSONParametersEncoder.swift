//
//  JSONParametersEncoder.swift
//  WeatherApp
//
//  Created by Waind Storm on 27.09.21.
//

import Foundation

public struct JSONParametersEncoder: ParametersEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: RequestParameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkRequestError.encodingFailed
        }
    }
}

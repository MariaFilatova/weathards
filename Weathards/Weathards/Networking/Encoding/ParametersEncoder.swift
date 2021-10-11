//
//  ParametersEncoder.swift
//  WeatherApp
//
//  Created by Waind Storm on 26.09.21.
//

import Foundation

public typealias RequestParameters = [String:Any]

public protocol ParametersEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: RequestParameters) throws
}

//
//  HttpTask.swift
//  WeatherApp
//
//  Created by Waind Storm on 28.09.21.
//

import Foundation

public typealias HttpHeaders = [String : String]

/// HTTPTask is responsible for the configuration of certain request.
public enum HttpTask {
    case request
    
    case requestParameters(bodyParameters: RequestParameters?,
                           urlParameters: RequestParameters?)
    
    case requestParametersAndHeaders(bodyParameters: RequestParameters?,
                                     urlParameters: RequestParameters?,
                                     additionHeaders: HttpHeaders?)
}

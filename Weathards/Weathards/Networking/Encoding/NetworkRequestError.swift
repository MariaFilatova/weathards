//
//  NetworkRequestError.swift
//  WeatherApp
//
//  Created by Waind Storm on 26.09.21.
//

import Foundation

//public enum NetworkError: String, Error {
//    case parametersNil = "Parameters were nil"
//    case encodingFailed = "Parameter encoding failed"
//    case missingURL = "URL is nil"
//}

public enum NetworkRequestError: Error {
    case missingURL
    case encodingFailed
    case unableToCreateRequest
    case requestFailed(Error)
    case noResponse
    case failingHTTPStatusCode(HttpStatusCode, ResponseData?)
    
    public typealias ResponseData = Any
    public typealias HttpStatusCode = Int
}

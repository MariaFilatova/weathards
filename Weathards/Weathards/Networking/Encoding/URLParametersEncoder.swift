//
//  URLParametersEncoder.swift
//  WeatherApp
//
//  Created by Waind Storm on 26.09.21.
//

import Foundation

public struct URLParametersEncoder: ParametersEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: RequestParameters) throws {
        guard let url = urlRequest.url else { throw NetworkRequestError.missingURL }
        
        if
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
            !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            for (key, value)  in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charseet=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
}

//
//  EndpointType.swift
//  WeatherApp
//
//  Created by Waind Storm on 26.09.21.
//

import Foundation

/// This protocol stores all info required for configuring request.
protocol EndpointType {
    var baseURLString: String { get }
    var path: String { get }
    var httpMethod: HttpMethod { get }
    var task: HttpTask { get }
    var headers: HttpHeaders? { get }
}

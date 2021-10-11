//
//  OpenWeatherApi.swift
//  WeatherApp
//
//  Created by Waind Storm on 26.09.21.
//

import Foundation

public enum OpenWeatherApi {
    case weatherByCoordinates(lat: Double, lon: Double)
}

extension OpenWeatherApi: EndpointType {
    var baseURLString: String {
        "https://api.openweathermap.org/data/2.5/"
    }
    
    var path: String {
        switch self {
        case .weatherByCoordinates(let lat, let lon):
            return "onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(openWeatherApiKey)&units=metric"
        }
    }
    
    var httpMethod: HttpMethod {
        return .get
    }
    
    var task: HttpTask {
        return .request
    }
       
    var headers: HttpHeaders? {
        return nil
    }
}

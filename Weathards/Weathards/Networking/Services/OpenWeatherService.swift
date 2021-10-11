//
//  OpenWeatherService.swift
//  WeatherApp
//
//  Created by Waind Storm on 28.09.21.
//

import Foundation

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first"
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated"
    case failed = "Network request failed"
    case noData = "Response returned with no data to decode"
    case unableToDecode = "We could notdecode the response"
}

enum Result<String> {
    case success
    case failure(String)
}

class OpenWeatherService {
    static let shared = OpenWeatherService()
    private init() {}
    
    private let router = Router<OpenWeatherApi>()
    
    func getWeatherFor(lat: Double, lon: Double, completion: @escaping (_ weather: WeatherForecast?,_ error: String?) -> ()) {
        router.request(.weatherByCoordinates(lat: lat, lon: lon)) { [weak self] data, response, error in
            if let error = error {
                completion(nil, error.localizedDescription)
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self?.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(WeatherForecast.self, from: responseData)
                        completion(apiResponse, nil)
                    } catch let DecodingError.dataCorrupted(context) {
                        print(context)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("Key '\(key)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    } catch let DecodingError.valueNotFound(value, context) {
                        print("Value '\(value)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    } catch let DecodingError.typeMismatch(type, context)  {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    } catch {
                        print("error: ", error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                case .none:
                    completion(nil, nil)
                }
            }
        }
    }
    
    private func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}

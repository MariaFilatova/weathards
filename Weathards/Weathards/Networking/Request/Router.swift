//
//  Router.swift
//  WeatherApp
//
//  Created by Waind Storm on 27.09.21.
//

import Foundation

class Router<Endpoint: EndpointType>: NetworkRouter {
    private var task: URLSessionTask?
    
    func request(_ route: Endpoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request) { data, response, error in
                completion(data, response, error)
            }
        } catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    private func buildRequest(from route: Endpoint) throws -> URLRequest {
        guard let url = URL(string: "\(route.baseURLString)\(route.path)") else { throw NetworkRequestError.missingURL }
        
        var request = URLRequest(url: url,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
            case .requestParameters(bodyParameters: let bodyParameters,
                                    urlParameters: let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters,
                                             urlParameters: urlParameters,
                                             request: &request)
                
            case .requestParametersAndHeaders(bodyParameters: let bodyParameters,
                                              urlParameters: let urlParameters,
                                              additionHeaders: let additionHeaders):
                self.additionalHeaders(additionHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters,
                                             urlParameters: urlParameters,
                                             request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    private func configureParameters(bodyParameters: RequestParameters?,
                                     urlParameters: RequestParameters?,
                                     request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParametersEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParametersEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }
    
    private func additionalHeaders(_ additionHeaders: HttpHeaders?, request: inout URLRequest) {
        guard let headers = additionHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}

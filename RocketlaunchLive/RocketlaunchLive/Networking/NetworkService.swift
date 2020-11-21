//
//  NetworkService.swift
//  RocketlaunchLive
//
//  Created by Nanter on 21.11.2020.
//

import Foundation
import Combine

class NetService {

  func requestPublisher<T: Decodable>(url: String, httpMethod: HttpMethod, parameters: [String: String] = [:], httpHeaders: [String: String] = [:], responseType: T.Type = T.self, decoder: JSONDecoder = .init()) -> AnyPublisher<T, Error> {
    var urlString = url
    if httpMethod == .get {
      if !parameters.isEmpty {
        urlString += "?"
      }
      for (index, key) in parameters.keys.enumerated()  {
        urlString += "\(key)=\(parameters[key] ?? "")"
        if index < parameters.count - 1 {
          urlString += "&"
        }
      }
    }
    let url = URL(string: urlString)!
    var request = URLRequest(url: url)
    request.httpMethod = httpMethod.rawValue
    if httpMethod == .post && !parameters.isEmpty {
      request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
    }
    for (key, value) in httpHeaders {
      request.setValue(value, forHTTPHeaderField: key)
    }
    return URLSession.shared.dataTaskPublisher(for: request)
      .print()
      .map(\.data)
      .decode(type: T.self, decoder: decoder)
      .print()
      .eraseToAnyPublisher()
  }

  enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case head = "HEAD"
    case trace = "TRACE"
    case connect = "CONNECT"
    case options = "OPTIONS"
  }
}

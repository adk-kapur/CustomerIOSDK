//
//  CIOURLParameterEncoder.swift
//  CustomerioStarWars
//
//  Created by Amandeep Kaur on 31/08/21.
//

import Foundation

// Struct to encode URL Parameters
public struct CIOURLParameterEncoder: CIOParameterEncoder {

    /// Encode Url requests and the parameters
    /// - Parameters:
    ///   - urlRequest: URL Request for the call
    ///   - parameters: URL Parameters
    /// - Throws: Network error if any
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters?, arrDictParameters: ArrayParameters?) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingURL }
        
        /// Create a structure that parses URLs into and constructs URLs from their constituent parts.
        if var urlComponents = URLComponents(url: url,
                                             resolvingAgainstBaseURL: false), let parameters = parameters, !parameters.isEmpty {

            urlComponents.queryItems = [URLQueryItem]()
            for (key,value) in parameters {
                let queryItem = URLQueryItem(name: key,
                                             value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            /// Create url
            let path = "\(urlComponents.path)"
            let query = "\(urlComponents.query ?? "")"
            let host = "\(urlComponents.host ?? "")"
            let scheme =  "\(urlComponents.scheme ?? "")"
            let urlString = "\(scheme)://\(host)\(path)?\(query)"
            if let decodeURL = urlComponents.url?.absoluteString.decodeUrl() {
                urlRequest.url = URL(string: decodeURL)
            } else {
                urlRequest.url = URL(string: urlString)
            }
        }
        else if var urlComponents = URLComponents(url: url,
                                             resolvingAgainstBaseURL: false), let parameters = arrDictParameters, !parameters.isEmpty {

            urlComponents.queryItems = [URLQueryItem]()
            for params in parameters {
                for (key,value) in params {
                    let queryItem = URLQueryItem(name: key,
                                                 value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed))
                    urlComponents.queryItems?.append(queryItem)
                }
            }
            /// Create url using components
            let path = "\(urlComponents.path)"
            let query = "\(urlComponents.query ?? "")"
            let host = "\(urlComponents.host ?? "")"
            let scheme =  "\(urlComponents.scheme ?? "")"
            let urlString = "\(scheme)://\(host)\(path)?\(query)"
            if let decodeURL = urlComponents.url?.absoluteString.decodeUrl() {
                urlRequest.url = URL(string: decodeURL)
            } else {
                urlRequest.url = URL(string: urlString)
            }
        }
        
        // Send v=1 as Content-type
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json;v=1", forHTTPHeaderField: "Content-Type")
        }
    }
}

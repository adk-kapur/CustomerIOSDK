//
//  CIOJSONParameterEncoder.swift
//  CustomerioStarWars
//
//  Created by Amandeep Kaur on 31/08/21.
//

import Foundation

/// Struct to encode Body JSON Parameters
public struct CIOJSONParameterEncoder: CIOParameterEncoder {
    
    /*
     * This function encodes the url request and the parameters (both [String: Any] and [[String: Any]]
     */
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters?, arrDictParameters : ArrayParameters?) throws {
        do {
            
            /// If [String: Any] format has to be encoded
            if let parameters = parameters {
                let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                urlRequest.httpBody = jsonAsData
                if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                    urlRequest.setValue("application/json;v=1", forHTTPHeaderField: "Content-Type")
                }
            }
                /// If [[String: Any]] format has to be encoded
            else if let arrDictParameters = arrDictParameters {
                let jsonAsData = try JSONSerialization.data(withJSONObject: arrDictParameters, options: .prettyPrinted)
                urlRequest.httpBody = jsonAsData
                if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                    urlRequest.setValue("application/json;v=1", forHTTPHeaderField: "Content-Type")
                }
            }
        }catch {
            throw NetworkError.encodingFailed
        }
    }
}

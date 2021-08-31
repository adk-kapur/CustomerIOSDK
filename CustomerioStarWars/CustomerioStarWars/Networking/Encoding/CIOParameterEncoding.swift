//
//  CIOParameterEncoding.swift
//  CustomerioStarWars
//
//  Created by Amandeep Kaur on 31/08/21.
//

import Foundation

public typealias Parameters = [String: Any]
public typealias ArrayParameters = [[String: Any]]

/// This protocol is conformed to encode urlRequests and other parameters for API request
public protocol CIOParameterEncoder {
    
    /// Encode Url requests and the parameters. urlRequest is inout property which means the value can be changed inside
    /// this function and those changes reflect in the original value outside the function
    ///
    /// - Parameters:
    ///   - urlRequest: URL Request for the call
    ///   - parameters: URL Parameters
    /// - Throws: Network error if any
    func encode(urlRequest: inout URLRequest, with parameters: Parameters?, arrDictParameters : ArrayParameters?) throws
}

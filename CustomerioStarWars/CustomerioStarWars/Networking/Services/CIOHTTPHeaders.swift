//
//  CIOHTTPHeaders.swift
//  CustomerioStarWars
//
//  Created by Amandeep Kaur on 31/08/21.
//

import Foundation

public typealias HTTPHeaders = [String: String]


/// Enum to handle tasks depending upon request type
public enum HTTPTask {
    
    /// use this if there is no body or url parameters and no additional headers
    case request
}

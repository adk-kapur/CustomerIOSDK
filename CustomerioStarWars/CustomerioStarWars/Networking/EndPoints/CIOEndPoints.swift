//
//  CIOEndPoints.swift
//  CustomerioStarWars
//
//  Created by Amandeep Kaur on 31/08/21.
//

import Foundation

/*
 * Protocol to conform important components of a URL request
 */
protocol CIOEndPointType {
    var scheme: String { get }
    var host: String { get }
    var method: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    var path: String { get }
}

/// Default scheme, host and headers for Endpoints
extension CIOEndPointType {
    var scheme: String { return Config().getProtocol() }
    var host: String { return Config().getCIOStarWarsHost() }
    var headers: HTTPHeaders? {
       return ["Content-Type" : "application/json;v=1"]
    }
}

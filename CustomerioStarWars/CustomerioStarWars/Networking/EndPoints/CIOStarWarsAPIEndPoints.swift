//
//  CIOStarWarsAPIEndPoints.swift
//  CustomerioStarWars
//
//  Created by Amandeep Kaur on 31/08/21.
//

import Foundation

/**
 * End points for Star wars APIs
 */
enum CIOStarWarsAPIEndPoints: CIOEndPointType {

    case getPeopleData(peopleNumber : Int)
    case getFilmsData
    case getPlanetsData(planetNumber : Int)

    /// method variable which indicates what method we are using to request to the server
    var method: HTTPMethod {
        switch self {
        case .getPeopleData, .getFilmsData , .getPlanetsData:
            return .get
        }
    }
    /// Enum to handle tasks depending upon request type , can be request or request for a body or headers etc
    var task: HTTPTask {
        switch self {
        case .getPeopleData, .getFilmsData , .getPlanetsData:
            return .request
        }
    }

    /// path variable which returns the path for each case
    var path: String {
        switch self {
        case .getPeopleData(let peopleNumber):
            return "\(Config().getPeopleEndpoint())/\(peopleNumber)"
        case .getFilmsData:
            return Config().getFilmsEndpoint()
        case .getPlanetsData(let planetNumber):
            return "\(Config().getPlanetsEndpoint())/\(planetNumber)"
        }
    }
}

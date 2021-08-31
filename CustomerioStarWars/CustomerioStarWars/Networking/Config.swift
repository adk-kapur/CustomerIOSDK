//
//  Config.swift
//  CustomerioStarWars
//
//  Created by Amandeep Kaur on 31/08/21.
//

import Foundation

class Config {
    
    private var configData : [String: Any]?
    
    init() {
        configData = getPlist(withName: CIOConstants.ConfigPlist)
    }
    
    // MARK:- PRIVATE FUNCTIONS
    private func getPlist(withName name: String) -> [String : Any]?
    {
        if  let path = Bundle(for: Self.self).path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path)
        {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String : Any]
        }

        return nil
    }
    
    private func getEndpoints() -> [String: Any]? {
        guard let configData = configData else {
            return nil
        }
        guard let endpoints = configData[CIOConstants.Endpoints] as? [String : Any] else {
            return nil
        }
        return endpoints
    }
    
    // MARK:- GET VALUES FUNCTIONS
    func getPeopleEndpoint() -> String {
         guard let endpoints = getEndpoints() else {
             return ""
         }
         return endpoints[CIOConstants.PeopleEndpoint] as! String
         
    }
    
    func getFilmsEndpoint() -> String {
        guard let endpoints = getEndpoints() else {
            return ""
        }
        return endpoints[CIOConstants.FilmsEndpoint] as! String
    }
    
    func getPlanetsEndpoint() -> String {
        guard let endpoints = getEndpoints() else {
            return ""
        }
        return endpoints[CIOConstants.PlanetsEndpoint] as! String
    }
    
    func getProtocol() -> String {
        guard let configData = configData else {
            return ""
        }
        guard let protocolConfig = configData[CIOConstants.ProtocolConfig] as? String else {
            return ""
        }
        return protocolConfig
    }
    
    func getCIOStarWarsHost() -> String {
        guard let configData = configData else {
            return ""
        }
        guard let hostConfig = configData[CIOConstants.HostConfig] as? String else {
            return ""
        }
        return hostConfig
    }
    
}

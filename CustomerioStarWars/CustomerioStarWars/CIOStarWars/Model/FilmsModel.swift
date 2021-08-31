//
//  FilmsModel.swift
//  CustomerioStarWars
//
//  Created by Amandeep Kaur on 27/08/21.
//

import Foundation

public struct FilmsResponse: Codable {
    public let count: Int?
    public let results : [Results]?
}


public struct Results : Codable {
    public let title : String?
    public let opening_crawl : String?
    public let release_date : String?
}

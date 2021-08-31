//
//  CIONetworkError.swift
//  CustomerioStarWars
//
//  Created by Amandeep Kaur on 31/08/21.
//

import Foundation


// List of all possible network errors
public enum NetworkError : String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
    case dataError = "Data is nil."
    case internet
    case cache
    //add other possible network errors here
}

//
//  CIONetworkingExtensions.swift
//  CustomerioStarWars
//
//  Created by Amandeep Kaur on 31/08/21.
//

import Foundation

extension String {
    
    /// Decodes URL
    /// - Returns: Decoded URL String
    /// Usecase : "URLSTRING".decodeUrl()
    func decodeUrl() -> String {
        return self.removingPercentEncoding!
    }
    
    
    /// Encodes URL
    /// - Returns: Encoded URL String
    /// Usecase : "URLSTRING".encodeUrl()
    func encodeUrl() -> String? {
        // Remove pre-existing encoding,
        guard let decodedString = self.removingPercentEncoding,
            // encode any Unicode characters so URLComponents doesn't choke,
            let unicodeEncodedString = decodedString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            // break into components to use proper encoding for each part,
            let components = URLComponents(string: unicodeEncodedString),
            // and reencode, to revert decoding while encoding missed characters.
            let percentEncodedUrl = components.url else {
                // Encoding failed
                return nil
        }
        return "\(percentEncodedUrl)"
    }
}

//
//  CIONetworkHelper.swift
//  CustomerioStarWars
//
//  Created by Amandeep Kaur on 31/08/21.
//

import Foundation

/// URL Host for API Call
let host = Config().getCIOStarWarsHost()

/// URL Scheme for API Call
let scheme = Config().getProtocol()


/// Creates URL with host, scheme & endpoint
class CIONetworkHelper: NSObject {
    class func createUrl(fromPath path: String,scheme: String = scheme, host: String = host) -> URL? {
        var components = URLComponents()
        /// scheme subcomponent of the URL.
        components.scheme = scheme
        /// host subcomponent
        components.host = host
        /// path subcomponent.
        components.path = path
        guard let urlString = components.url?.absoluteString.removingPercentEncoding else { return nil }
        
        /// Return complete URL
        return URL(string: urlString)
    }
}

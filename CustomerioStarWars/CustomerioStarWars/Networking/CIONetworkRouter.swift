//
//  CIONetworkRouter.swift
//  CustomerioStarWars
//
//  Created by Amandeep Kaur on 31/08/21.
//

import Foundation
import UIKit

protocol Router: AnyObject {
    associatedtype EndPoint: CIOEndPointType
    func request<T: Codable>(router: EndPoint, completion: @escaping (Result<T, Error>) -> ())
}


/// Class to perform API request call
class CIONetworkRouter<EndPoint: CIOEndPointType>: Router {

    
    /// Makes API call using native's URLSession
    /// - Parameters:
    ///   - router: Endpoints to build request
    ///   - completion: Returns Result with Generic Response & Error
    /// - Returns: Generic response corresponding to request & error
    func request<T: Codable>(router: EndPoint, completion: @escaping (Result<T, Error>) -> ()) {
            
            // Build URL Request with required endpoints
        do {
            guard let urlRequest = try buildRequest(from: router) else {
                completion(.failure(NetworkError.missingURL))
                return
            }
            let session = URLSession.shared
            let task = session.dataTask(with: urlRequest) { (data, response, error ) in
                // In case, API fails return failure error
                guard let data = data else {
                    completion(.failure(NetworkError.dataError))
                    return
                }
                
                do {
                    
                    // Decode JSON response corresponding to generic response struct
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        // Complete the call with success response & the decoded data
                        completion(.success(responseObject))
                        return
                    }
                }
                catch (let decoderError){
                    print("ERR 10111: \(decoderError)")
                    completion(.failure(NetworkError.cache))
                    return
                }
            }
        task.resume()
        }
        catch {
            completion(.failure(NetworkError.missingURL))
            return
        }
    }
    

    /// Building request using endpoints
    /// - Parameters:
    ///   - router: Endpoints for API call
    ///   - param: Optional parameters
    /// - Throws: Error if any
    /// - Returns: Well-structured URLRequest
    fileprivate func buildRequest(from router: CIOEndPointType, param: String = "") throws -> URLRequest? {
        guard let url = CIONetworkHelper.createUrl(fromPath: router.path,
                                         scheme: router.scheme,
                                         host: router.host) else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        urlRequest.httpMethod = router.method.rawValue
        
        switch router.task {
            case .request:
                urlRequest.setValue("application/json;v=1", forHTTPHeaderField: "Content-Type")
        }
        return urlRequest
    }
}

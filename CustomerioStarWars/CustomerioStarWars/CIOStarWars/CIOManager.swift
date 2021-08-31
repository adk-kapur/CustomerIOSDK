//
//  CIOManager.swift
//  CustomerioStarWars
//
//  Created by Amandeep Kaur on 27/08/21.
//

import Foundation

/**
 * Manager class responsible for interaction between SDK and the client application
 * Helps client app fetch information about the following :
 *
 * - Planets
 * - Films
 * - People
 */
open class CIOManager : NSObject {

    let starWarsRouter = CIONetworkRouter<CIOStarWarsAPIEndPoints>()
    
    /**
     * getAllFilms fetches information about Films and sends it back to the client app. It returns nil in case some error occurs
     */
    open func getAllFilms(completionHandler : @escaping(FilmsResponse?) -> Void) {
        
        starWarsRouter.request(router: .getFilmsData) {(result: Result<FilmsResponse, Error>)  in
            
            DispatchQueue.main.async {
                switch result {
                case .success:
                    do {
                        let response = try result.get()
                        completionHandler(response)
                        
                    } catch {
                        completionHandler(nil)
                    }
                case .failure(_):
                    completionHandler(nil)
                }
            }
        }
    }
    
    /**
     * getPeopleEyes returns eye color of 'forCount' number of people.
     * This function uses dispatch group to run multiple apis in one instance and return consolidated response of results of all apis
     */
    open func getPeopleEyes(forCount number : Int, completionHandler : @escaping([People]?) -> Void) {
        
        let group = DispatchGroup()

        var peopleData : [People] = [People]()
        for num in 1...number {
            
            group.enter()
            starWarsRouter.request(router: .getPeopleData(peopleNumber : num)) { (result: Result<People, Error>) in
                do {
                    let response = try result.get()
                    print(response)
                    peopleData.append(response)
                } catch (let error) {
                    print("ERR 10112 #\(num): \(error)")
                }
                group.leave()
            }
        }
        
        // When notified, return peopleData in completion Handler
        group.notify(queue: .main) {
           completionHandler(peopleData)
        }
    }
    
    /**
     * getPlanets fetches information about planets and returns consolidated information of multiple api response.
     */
    open func getPlanets(forCount number : Int, completionHandler : @escaping([Planet]?) -> Void) {
        
        let group = DispatchGroup()

        var planetData : [Planet] = [Planet]()
        for num in 1...number {
            
            group.enter()
            starWarsRouter.request(router: .getPlanetsData(planetNumber: num)) { (result: Result<Planet, Error>) in
                do {
                    let response = try result.get()
                    planetData.append(response)
                } catch (let error) {
                    print("ERR 10113 #\(num): \(error)")
                }
                group.leave()
            }
        }
        
        // When notified, return planetData in completion Handler
        group.notify(queue: .main) {
           completionHandler(planetData)
        }
    }
}

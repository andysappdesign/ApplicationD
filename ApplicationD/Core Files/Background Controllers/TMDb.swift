//
//  TMDb.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 28/07/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class TMDB {
    
    let API = "df8304134d840c4d6d11ca3c0055d5c6"
    let sessionId = UserDefaults.standard.string(forKey: "sessionId") ?? "000000000"
    let accountId = UserDefaults.standard.string(forKey: "accountId") ?? "000000000"
    var requestId = ""
    
    // MARK:- TokenRequest
    
    func tokenRequest(completionHandler: @escaping (Bool) -> Void) {
        let url = "https://api.themoviedb.org/3/authentication/token/new?api_key=df8304134d840c4d6d11ca3c0055d5c6"
        var returnValue = ""
        
        AF.request(url, method: .get).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                returnValue = json["request_token"].stringValue
//                print("returnValue = \(returnValue)")
                self.requestId = returnValue
                completionHandler(true)
            case .failure(let error):
                print(error)
                self.requestId = ""
                completionHandler(false)
            
            }
        } // end of request
    } // end of requestToken
    
    // MARK: - CreateSession
    
    func createSession(completionHandler: @escaping (Bool) -> Void) {
        let url = "https://api.themoviedb.org/3/authentication/session/new?api_key=df8304134d840c4d6d11ca3c0055d5c6"
        let parameter : [String: String] = [
            "request_token" : requestId
        ]
        
        AF.request(url, method: .post, parameters: parameter).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let session = json["session_id"].stringValue
                self.updateSessionId(session) { (sessionResponse) in
                    if sessionResponse == true {
                        self.getTMDbAccount(session) { (accountResponse) in
                            if accountResponse == true {
                                completionHandler(true)
                            } else {
                                print("getTMDBAccount failed")
                                completionHandler(false)
                            }
                        }
                    } else {
                        print("updateSessionID failed")
                        completionHandler(false)
                    }
                }
            case .failure(let error):
                print("Error \(error)")
            }
        }
    } // end of createSession
    
    // MARK: - UpdateSessionId
    
    private func updateSessionId(_ id : String, completionHandler: @escaping (Bool) -> Void) {
        UserDefaults.standard.setValue(id, forKey: "sessionId")
        if UserDefaults.standard.string(forKey: "sessionId") == id {
            print("updated user id to \(UserDefaults.standard.string(forKey: "sessionId") ?? ". Error: No ID found")")
            completionHandler(true)
        } else {
            print("updated user id to \(UserDefaults.standard.string(forKey: "sessionId") ?? ". Error: No ID found")")
            completionHandler(false)
        }
        
    }
    
    //MARK: - GetTMDbAccount
    
   func getTMDbAccount(_ id: String, completionHandler: @escaping (Bool) -> Void) {
        let partUrl = "https://api.themoviedb.org/3/account?api_key=df8304134d840c4d6d11ca3c0055d5c6&session_id="
        let sessionId = id
        let url = partUrl + sessionId
        
        AF.request(url, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                let accoundId = json["id"].stringValue
                print("accountId: \(accoundId)")
                UserDefaults.standard.setValue(accoundId, forKey: "accountId")
                completionHandler(true)
            case .failure(let error):
                print(error)
                completionHandler(false)
            }
  
        }
        
    } // end of getTMDbAccount
    
    
    
    
    // MARK:- GetCredits
    
    func getCredits(movieID: Int, completionHandler: @escaping (JSON) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(self.API)&language=en-US"
        
        AF.request(url, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                completionHandler(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK:- GetImagesOfPerson
    
    func getImagesOfPerson(personID: Int, completionHandler: @escaping (JSON) -> Void) {
        let url = "https://api.themoviedb.org/3/person/\(personID)/images?api_key=\(self.API)"
        
        AF.request(url, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                completionHandler(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK:- GetMovieWatchList
    
    func getMovieWatchList(completionHandler: @escaping (JSON) -> Void) {
        let url = "https://api.themoviedb.org/3/account/\(self.accountId)/watchlist/movies?api_key=df8304134d840c4d6d11ca3c0055d5c6&language=en-GB&session_id=\(self.sessionId)&sort_by=created_at.asc&page=1"
        
        //print("sessionid: \(self.sessionId), accountId: \(self.accountId)")
        
        AF.request(url, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                //print(json)
                completionHandler(json)
            case .failure(let error):
                print(error)
            }
        } // end of AF.request
    } // end of getWatchList
    
    
    
}

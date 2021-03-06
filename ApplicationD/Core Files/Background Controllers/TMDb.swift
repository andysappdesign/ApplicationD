//
//  TMDb.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 28/07/2021.
//
//  This is soley a super class to the majority of the Controller classes and gives them all access to the TMDb API, this provides functions to load Lists, get Objects, get Movie Details, get Cast Details and create a User Account


import Alamofire
import SwiftyJSON
import SwiftUI

class TMDB {
    
    let API = "df8304134d840c4d6d11ca3c0055d5c6"
    let sessionId = UserDefaults.standard.string(forKey: "sessionId") ?? "000000000"
    let accountId = UserDefaults.standard.string(forKey: "accountId") ?? "000000000"
    var requestId = ""
    var watchID = 0
    var watchedID = 0
    var suggestionID = 0
    
    // MARK:- TokenRequest
    
    func tokenRequest(completionHandler: @escaping (Bool) -> Void) {
        let url = "https://api.themoviedb.org/3/authentication/token/new?api_key=\(self.API)"
        var returnValue = ""
        
        AF.request(url, method: .get).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                returnValue = json["request_token"].stringValue
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
        let url = "https://api.themoviedb.org/3/authentication/session/new?api_key=\(self.API)"
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
                            }
                        }
                    } else {
                        print("updateSessionID failed")
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
            completionHandler(true)
        } else {
            completionHandler(false)
        }
        
    }
    
    //MARK: - GetTMDbAccount
    
    func getTMDbAccount(_ id: String, completionHandler: @escaping (Bool) -> Void) {
        let partUrl = "https://api.themoviedb.org/3/account?api_key=\(self.API)&session_id="
        let sessionId = id
        let url = partUrl + sessionId
        
        AF.request(url, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                let accoundId = json["id"].stringValue
                UserDefaults.standard.setValue(accoundId, forKey: "accountId")
                completionHandler(true)
            case .failure(let error):
                print(error)
            }
            
        }
        
    } // end of getTMDbAccount
    
    // MARK:- Create List
    
    func createList(name: String, description: String, listId: String, completionHandler: @escaping (Bool) -> Void) {
        let url = "https://api.themoviedb.org/3/list?api_key=\(self.API)&session_id=\(self.sessionId)"
        let parameter : [String: String] = [
            "name" : name,
            "description" : description,
            "language" : "en"
        ]
        
        AF.request(url, method: .post, parameters: parameter).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
                if listId == "watch" {
                    self.watchID = json["list_id"].int!
                }
                if listId == "watched" {
                    self.watchedID = json["list_id"].int!
                }
                if listId == "sugguested" {
                    self.suggestionID = json["list_id"].int!
                }
                completionHandler(true)
            case .failure(let error):
                print("Error: \(error)")
            }
            
        }
        
    }
    
    // MARK:- getCreatedLists
    
    func getCreatedLists(completionHandler: @escaping (JSON) -> Void) {
        let url = "https://api.themoviedb.org/3/account/\(self.accountId)/lists?api_key=\(self.API)&language=en-US&session_id=\(self.sessionId)&page=1"
        
        AF.request(url, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                completionHandler(json)
            case .failure(let error):
                print(error)
            }
        } // end of AF.request
    }
    
    // MARK:- getListDetails
    
    func getListDetails(id: String, completionHandler: @escaping (JSON) -> Void) {
        let url = "https://api.themoviedb.org/3/list/\(id)?api_key=\(self.API)&language=en-US"
        
        AF.request(url, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                completionHandler(json)
            case .failure(let error):
                print(error)
            }
        } // end of AF.request
    }
    
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
        let url = "https://api.themoviedb.org/3/account/\(self.accountId)/watchlist/movies?api_key=\(self.API)&language=en-GB&session_id=\(self.sessionId)&sort_by=created_at.asc&page=1"
        
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
    
    
    // MARK:- Discover - Movies
    
    func discoverMovies(completionHandler: @escaping (JSON) -> Void) {
        let url = "https://api.themoviedb.org/3/discover/movie?api_key=\(self.API)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_providers=Disney%20Plus&watch_region=GB&with_watch_monetization_types=flatrate"
        
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
    
    // MARK:- SearchMovies
    
    func searchMovies(query: String, completionHandler: @escaping (JSON) -> Void) {
        
        let url = "https://api.themoviedb.org/3/discover/movie?with_watch_providers=390&with_text_query=\(query)&api_key=\(self.API)"
        
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
    
    // MARK:- GetMovieDetails
    
    func getMovieDetails(id: Int, completionHandler: @escaping (JSON) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(id)?api_key=\(self.API)&language=en-US"
        
        AF.request(url, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                completionHandler(json)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    // MARK:- GetMovieDetailsCollection
    
    // the function serves the purpose to collect a movies collection, if one is avaliable
    
    func getMovieDetailsCollection(id: Int, completionHandler: @escaping (Any) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(id)?api_key=\(self.API)&language=en-US"
        
        AF.request(url, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                let collection = json["belongs_to_collection"].object
                completionHandler(collection)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    // MARK:- AddMovieToList
    
    func addMovieToList(listID: Int, movieID: Int, completionHandler: @escaping (Bool) -> Void) {
        
        let listIDString = String(listID)
        let url = "https://api.themoviedb.org/3/list/\(listIDString)/add_item?api_key=\(self.API)&session_id=\(self.sessionId)"
        let parameter : [String: Int] = [
            "media_id" : movieID
        ]
        AF.request(url, method: .post, parameters: parameter).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                if json["status_message"].string! == "The item/record was updated successfully." {
                    completionHandler(true)
                } else if json["status_message"].string! == "Duplicate entry: The data you tried to submit already exists." {
                    completionHandler(true)
                } else {
                    print("item not added")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
            
        }
        
    }
    
    // MARK:- RemoveMovieFromList
    
    func removeMovieFromList(listID: Int, movieID: Int, completionHandler: @escaping (Bool) -> Void) {
        
        let listIDString = String(listID)
        let url = "https://api.themoviedb.org/3/list/\(listIDString)/remove_item?api_key=\(self.API)&session_id=\(self.sessionId)"
        let parameter : [String: Int] = [
            "media_id" : movieID
        ]
        
        AF.request(url, method: .post, parameters: parameter).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                if json["status_message"].string! == "The item/record was deleted successfully." {
                    completionHandler(true)
                } else if json["status_message"].string! == "Entry not found: The item you are trying to edit cannot be found." {
                    completionHandler(true)
                } else {
                    print("item not removed")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
            
        }
        
    }
    
    // GetCollectionDetails
    
    func getCollectionDetails(id: Int, completionHandler: @escaping (JSON) -> Void) {
        
        let url = "https://api.themoviedb.org/3/collection/\(id)?api_key=\(self.API)&language=en-US"
        
        AF.request(url, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                completionHandler(json)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    
    
    
}

//
//  MovieWatchList.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 01/05/2021.
//
// Class acts as a backend source for the Movies Watchlist
//

import Foundation
import Alamofire
import SwiftyJSON

class MovieWatchList {
    
    let api = "df8304134d840c4d6d11ca3c0055d5c6"
    let sessionId = UserDefaults.standard.string(forKey: "sessionId")
    let accountId = UserDefaults.standard.string(forKey: "accountId")
    
    // MARK: func getWatchList
    
    func getWatchList() {
        let url = "https://api.themoviedb.org/3/account/\(String(describing: self.accountId))/watchlist/movies?api_key=\(self.api)&language=en-GB&session_id=\(String(describing: self.sessionId))&sort_by=created_at.asc&page=100"
        
        AF.request(url, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
            case .failure(let error):
                print(error)
        
            }
        }
        
        
    } // end of getWatchList
    
    
    
    
    
    
}

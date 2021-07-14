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
import SwiftUI

class MovieWatchList: ObservableObject {
    
    let api = "df8304134d840c4d6d11ca3c0055d5c6"
    let sessionId = UserDefaults.standard.string(forKey: "sessionId") ?? "000000000"
    let accountId = UserDefaults.standard.string(forKey: "accountId") ?? "000000000"
    @Published var watchListArray: [JSON] = []
    
    // MARK: TESTING ONLY VARIABLES
    
    let TESTapi = "df8304134d840c4d6d11ca3c0055d5c6"
    let TESTsessionId = "3ebe85700311a36a740bb1f8cc4efe7b506cd9f4"
    let TESTaccountId = "9909049"
 
    // MARK:- loadList
    
    func loadList(completionHander: @escaping () -> Void) {
        getWatchList { (responce) in
            if responce != JSON() {
                self.watchListArray = responce["results"].arrayValue
                let count = self.watchListArray.count
                print("Watchlist contains \(count) items")
                print("Downloaded list sucessful")
                completionHander()
            } else {
                print("responce is empty")
                // TODO
            }
        } // end of getWatchList
    } // end of loadList
    
    // MARK: - func getWatchList
    
    private func getWatchList(completionHandler: @escaping (JSON) -> Void) {
        let url = "https://api.themoviedb.org/3/account/\(self.accountId)/watchlist/movies?api_key=df8304134d840c4d6d11ca3c0055d5c6&language=en-GB&session_id=\(self.sessionId)&sort_by=created_at.asc&page=1"
        
        //print("sessionid: \(self.sessionId), accountId: \(self.accountId)")
        
        AF.request(url, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
                completionHandler(json)
            case .failure(let error):
                print(error)
            }
        } // end of AF.request
    } // end of getWatchList
    
    // MARK: - func getObject

    private func getObject(positionNumber: Int) {
        let object = watchListArray[positionNumber]
    //    print(object)
        let posterURL = object["poster_path"].stringValue
        print(posterURL)
        
    } // end of getObject
    
    // MARK - getPosterURL
    
    private func getPosterURL(object: JSON) {
        
    }
    

}

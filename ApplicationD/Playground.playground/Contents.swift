import UIKit
import Alamofire
import SwiftyJSON

let api = "df8304134d840c4d6d11ca3c0055d5c6"
let sessionId = "f3c5d9c342c006e9ff1364a05c82f7ffd18bddd3"
let accountId = "9909049"

// MARK: func getWatchList

func getWatchList() {
    let url = "https://api.themoviedb.org/3/account/\(accountId)/watchlist/movies?api_key=\(api)&session_id=\(sessionId)&sort_by=created_at.asc&page=100"
    
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

getWatchList()

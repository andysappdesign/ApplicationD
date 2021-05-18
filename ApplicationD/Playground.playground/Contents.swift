import UIKit
import Alamofire
import SwiftyJSON

let api = "df8304134d840c4d6d11ca3c0055d5c6"
let sessionId = "3ebe85700311a36a740bb1f8cc4efe7b506cd9f4"
let accountId = "9909049"
var watchListArray: [JSON] = []

func loadList() {
    getWatchList { (responce) in
        if responce != JSON() {
            watchListArray = responce["results"].arrayValue
            let count = watchListArray.count
            print("Watchlist contains \(count) items")
//            print(watchListArray)
//            for i in 0..<count {
//                print(i)
//                getObject(positionNumber: i)
//            }
            let i = 0
            if i == 0 {
                print(i)
                getObject(positionNumber: i)
            } else {
                
            }
        } else {
            print("responce is empty")
            // TODO
        }
    } // end of getWatchList
} // end of loadList

// MARK: func getWatchList

func getWatchList(completionHandler: @escaping (JSON) -> Void) {
    let url = "https://api.themoviedb.org/3/account/\(accountId)/watchlist/movies?api_key=\(api)&session_id=\(sessionId)&sort_by=created_at.asc&page=1"
    
    AF.request(url, method: .get).responseJSON { (responce) in
        switch responce.result {
        case .success(let value):
            let json = JSON(value)
            completionHandler(json)
        case .failure(let error):
            print(error)
    
        }
    } // end of AF.request
    
} // end of getWatchList


// MARK: func getObject

private func getObject(positionNumber: Int) {
    let object = watchListArray[positionNumber]
//    print(object)
    let posterURL = object["poster_path"].stringValue
    print(posterURL)
    
} // end of getObject




private func getPoster() {
    
} // end of getPoster

loadList()


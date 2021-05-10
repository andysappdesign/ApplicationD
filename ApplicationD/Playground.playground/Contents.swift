import UIKit
import Alamofire
import SwiftyJSON

let api = "df8304134d840c4d6d11ca3c0055d5c6"
let sessionId = "3ebe85700311a36a740bb1f8cc4efe7b506cd9f4"
let accountId = "9909049"

// MARK: func getWatchList

func getWatchList() -> JSON {
    let url = "https://api.themoviedb.org/3/account/\(accountId)/watchlist/movies?api_key=\(api)&session_id=\(sessionId)&sort_by=created_at.asc&page=1"
    var listObject = JSON()
    
    AF.request(url, method: .get).responseJSON { (responce) in
        switch responce.result {
        case .success(let value):
            let json = JSON(value)
            //print(json)
            listObject = json
            print(listObject)
        case .failure(let error):
            print(error)
    
        }
    }
    print(listObject)
    return listObject
    
    
} // end of getWatchList

func getPoster() {
    
} // end of getPoster

// MARK: func getObject
// to use this command, state a int for the positionNumber of the object you would like
// if you would like a random item, enter 99999

func getObject(positionNumber: Int) {
    var listObject = JSON()
    
    if positionNumber != 99999 {
        listObject = getWatchList()
        if listObject != .null {
            let resultsObject = listObject["results"].arrayValue
            print(resultsObject)
            print(listObject)
            
        } else {
            print("JSON listObject is empty")
            
        }
        
    } else {
        print("findiong random position")
    }
    
} // end of getObject


getObject(positionNumber: 1)
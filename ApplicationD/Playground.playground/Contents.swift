import Foundation
import Alamofire
import SwiftyJSON

let API = "df8304134d840c4d6d11ca3c0055d5c6"

func movieDiscover(title: String) {
    let url = "https://api.themoviedb.org/3/discover/movie?api_key=\(API)&language=en_US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_providers=Disney%2B&watch_region=GBR&with_watch_monetization_types=flatrate"
    
    AF.request(url, method: .get).responseJSON { (responce) in
        switch responce.result {
        case .success(let value):
            let json = JSON(value)
            print(json)
        case .failure(let error):
            print(error)
        
        }
        
    }
}

movieDiscover(title: "pirates")

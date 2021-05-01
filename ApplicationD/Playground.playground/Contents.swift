import UIKit
import Alamofire
import SwiftyJSON

func getTMDbAccount(_ id: String) {
    let partUrl = "https://api.themoviedb.org/3/account?api_key=df8304134d840c4d6d11ca3c0055d5c6&session_id="
    let sessionId = id
    let url = partUrl + sessionId
    print(url)
    
    AF.request(url, method: .get).responseJSON { (responce) in
        switch responce.result {
        case .success(let value):
            let json = JSON(value)
            let accoundId = json["id"].stringValue
            print("accountId: \(accoundId)")
            UserDefaults.standard.setValue(accoundId, forKey: "accountId")
        case .failure(let error):
            print(error)
        }

    }
    
} // end of getTMDbAccount

getTMDbAccount("e4a3df067f60ddb7a003c924b0a857db9af8080d")

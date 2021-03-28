//
//  TMDBAPI.swift
//  Application D
//
//  Created by Andrew Cumming on 16/03/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class TMBDAPI {
    
    // URL Preperation
    let url = "https://api.themoviedb.org/3/movie/76341?api_key=df8304134d840c4d6d11ca3c0055d5c6"

    // MARK: - func searchBasic
    
    func searchBasic() {
        AF.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    } // end of searchBasic
    
    
    
    
    
} // end of class TMBDAPI


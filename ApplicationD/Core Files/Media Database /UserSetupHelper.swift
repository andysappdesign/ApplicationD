//
//  UserSetupHelper.swift
//  Application D
//
//  Created by Andrew Cumming on 25/03/2021.
//

import Foundation
import Alamofire
import SwiftyJSON


class UserSetupHelper: ObservableObject {
    @Published var id: String = ""
    
    // MARK: - func request
    
    func request() {
        let url = "https://api.themoviedb.org/3/authentication/token/new?api_key=df8304134d840c4d6d11ca3c0055d5c6"
        var returnValue = ""
        
        AF.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                returnValue = json["request_token"].stringValue
                print("returnValue = \(returnValue)")
                self.id = returnValue
            case .failure(let error):
                print(error)
                self.id = ""
            }
        } // end of request

    } // end of requestToken
    
    // MARK: - func createSession
    
    func createSession() {
        let url = "https://api.themoviedb.org/3/authentication/session/new?api_key=df8304134d840c4d6d11ca3c0055d5c6"
        let parameter : [String: String] = [
            "request_token" : id
        ]
        
        AF.request(url, method: .post, parameters: parameter).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    } // end of createSession
    
}

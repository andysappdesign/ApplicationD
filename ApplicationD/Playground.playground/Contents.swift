import Foundation
import Alamofire
import SwiftyJSON
import SwiftUI

let API = "df8304134d840c4d6d11ca3c0055d5c6"
let sessionID = "58f9be87c205f31fd620983d4599e72f4f30bd65"

var jsonSearchArray: [JSON] = []
var objectSearchArray: [JSONMovieObject] = []
var searchRowCount: Int = 0
var searchRowObjectPositions = [[Int]]()

func createList(name: String, description: String, completionHandler: @escaping (JSON) -> Void) {
    let url = "https://api.themoviedb.org/3/list?api_key=\(API)&session_id=\(sessionID)"
    let parameter : [String: String] = [
        "name" : name,
        "description" : description,
        "language" : "en"
    ]
    
    AF.request(url, method: .post, parameters: parameter).responseJSON { (responce) in
        switch responce.result {
        case .success(let value):
            print("sucsess - \(value)")
        case .failure(let error):
            print("Error: \(error)")
        }
        
    }
    
}

createList(name: "Test", description: "This is a test list") { _ in
    
}



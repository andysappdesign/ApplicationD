import Foundation
import Alamofire
import SwiftyJSON
import SwiftUI

let API = "df8304134d840c4d6d11ca3c0055d5c6"
let sessionID = "77920f22bbad8b3a855ecaca28036b4ec4f8198c"

var jsonSearchArray: [JSON] = []
var objectSearchArray: [JSONMovieObject] = []
var searchRowCount: Int = 0
var searchRowObjectPositions = [[Int]]()



func createList(name: String, description: String, listId: String, completionHandler: @escaping (Bool) -> Void) {
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
            let json = JSON(value)
            print(value)
            let id = json["list_id"].stringValue
            print(id)
            UserDefaults.standard.setValue(id, forKey: "\(listId)")
            completionHandler(true)
        case .failure(let error):
            print("Error: \(error)")
        }
        
    }
    
}

createList(name: "Test", description: "This is a test list", listId: "test") { _ in
    
}



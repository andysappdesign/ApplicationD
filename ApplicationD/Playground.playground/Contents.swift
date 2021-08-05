import Foundation
import Alamofire
import SwiftyJSON
import SwiftUI

let API = "df8304134d840c4d6d11ca3c0055d5c6"
let sessionId = "77920f22bbad8b3a855ecaca28036b4ec4f8198c"

var jsonSearchArray: [JSON] = []
var objectSearchArray: [JSONMovieObject] = []
var searchRowCount: Int = 0
var searchRowObjectPositions = [[Int]]()
var exampleMovieId = 17979
var testListId = 7103382

var watchId = 0
var watchedId = 0
var suggestionId = 0



func createList(name: String, description: String, listId: String, completionHandler: @escaping (Bool) -> Void) {
    let url = "https://api.themoviedb.org/3/list?api_key=\(API)&session_id=\(sessionId)"
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
            if listId == "watch" {
                watchId = json["list_id"].int!
            }
            if listId == "watched" {
                watchedId = json["list_id"].int!
            }
            if listId == "suggestion" {
                suggestionId = json["list_id"].int!
            }
            completionHandler(true)
        case .failure(let error):
            print("Error: \(error)")
        }
        
    }
    
}

func addMovieToList(listID: Int, movieID: Int, completionHandler: @escaping (Bool) -> Void) {
    
    let listIDString = String(listID)
    let url = "https://api.themoviedb.org/3/list/\(listIDString)/add_item?api_key=\(API)&session_id=\(sessionId)"
    let parameter : [String: Int] = [
        "media_id" : movieID
    ]
    
    AF.request(url, method: .post, parameters: parameter).responseJSON { (responce) in
        switch responce.result {
        case .success(let value):
            let json = JSON(value)
            if json["status_message"].string! == "The item/record was updated successfully." {
                completionHandler(true)
            } else {
                print("item not added")
            }
        case .failure(let error):
            print("Error: \(error)")
        }
        
    }
    
}

func removeMovieFromList(listID: Int, movieID: Int, completionHandler: @escaping (Bool) -> Void) {
    
    let listIDString = String(listID)
    let url = "https://api.themoviedb.org/3/list/\(listIDString)/remove_item?api_key=\(API)&session_id=\(sessionId)"
    let parameter : [String: Int] = [
        "media_id" : movieID
    ]
    
    AF.request(url, method: .post, parameters: parameter).responseJSON { (responce) in
        switch responce.result {
        case .success(let value):
            let json = JSON(value)
            print(json)
            if json["status_message"].string! == "The item/record was deleted successfully." {
                completionHandler(true)
            } else {
                print("item not added")
            }
        case .failure(let error):
            print("Error: \(error)")
        }
        
    }
    
}

//addMovieToList(listID: testListId, movieID: exampleMovieId) { _ in
//    
//}

removeMovieFromList(listID: testListId, movieID: exampleMovieId) { _ in
    print("added")
}



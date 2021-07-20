import Foundation
import Alamofire
import SwiftyJSON

let movieID = 508943
let API = "df8304134d840c4d6d11ca3c0055d5c6"
var castArray: [JSON] = []
var objectArray: [castObjects] = []
var fourCastArray: [castObjects] = []

var firstPersonURL = ""
var secondPersonURL = ""
var thirdPersonURL = ""
var fourthPersonURL = ""

struct castObjects: Identifiable {
    
    let id: Int
    let know_for_department: String
    let name: String
    let popularitty: Int
    let cast_id: Int
    
}

func loadList(completionHander: @escaping (JSON) -> Void) {
    let url = "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(API)&language=en-US"
    
    AF.request(url, method: .get).responseJSON { (responce) in
        switch responce.result {
        case .success(let value):
            let json = JSON(value)
            completionHander(json)
        case .failure(let error):
            print(error)
        }
    }
}

func getObjects() {
    for i in 0..<castArray.count {
        let json = castArray[i]
        let object = castObjects(id: json["id"].int!, know_for_department: json["known_for_department"].string!, name: json["name"].string!, popularitty: json["popularity"].int!, cast_id: json["cast_id"].int!)
        objectArray.append(object)
    }
}

func getCast(completionHandler: @escaping () -> Void) {
    loadList { (responce) in
        if responce != JSON() {
            castArray = responce["cast"].arrayValue
            getObjects()
            sortList()
            print("getCast completed")
            completionHandler()
            
        } else {
            print("responce is empty")
        }
    }
}

func sortList() {
    for i in 1...4 {
        let temp = objectArray[i]
        print(temp)
        fourCastArray.append(temp)
    }

    
}

// MARK:- getProfilePic

func getProfilePic(personID: Int, completionHandler: @escaping (String) -> Void) {
    getImages(personID: personID) { (responce) in
        if responce != JSON() {
            let tempArray = responce["profiles"].array!
            let object = tempArray[0]
            let path = object["file_path"].string!
            completionHandler(path)
            
        } else {
            print("responce is empty")

        }
        
    }
    
}

// MARK: getImages

func getImages(personID: Int, completionHandler: @escaping (JSON) -> Void) {
    let url = "https://api.themoviedb.org/3/person/\(personID)/images?api_key=\(API)"
    
    AF.request(url, method: .get).responseJSON { (responce) in
        switch responce.result {
        case .success(let value):
            let json = JSON(value)
            completionHandler(json)
        case .failure(let error):
            print(error)
        }
    }
}

func populateCastRow() {
    getCast {
        for i in 0...fourCastArray.count {
            if i == 0 {
                let temp = fourCastArray[i]
                let id = temp.id
                getProfilePic(personID: id) { (responce) in
                    firstPersonURL = responce
                    print("firstPersonURL: \(firstPersonURL)")
                    
                }
            } // end of first person
            if i == 1 {
                let temp = fourCastArray[i]
                let id = temp.id
                getProfilePic(personID: id) { (responce) in
                    secondPersonURL = responce
                    print("secondPersonURL: \(secondPersonURL)")
                    
                }
            } // end of second person
            if i == 2 {
                let temp = fourCastArray[i]
                let id = temp.id
                getProfilePic(personID: id) { (responce) in
                    thirdPersonURL = responce
                    print("thirdPersonURL: \(thirdPersonURL)")
                    
                }
            } // end of third person
            if i == 3 {
                let temp = fourCastArray[i]
                let id = temp.id
                getProfilePic(personID: id) { (responce) in
                    fourthPersonURL = responce
                    print("fourthPersonURL: \(fourthPersonURL)")
                    
                }
            } // end of fourth person
        }
        
        
        
        
    }
    
}

populateCastRow()



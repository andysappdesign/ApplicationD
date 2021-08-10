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
var exampleMovieId = 1865
// christmas carol - 17979
// luca - 508943
// pirates of the carribean - 1865
// hocus pocus - 555032
var testListId = 7103382

var watchId = 0
var watchedId = 0
var suggestionId = 0

struct JSONCollection {
    
    var backdrop_path: String
    var id: Int
    var poster_path: String
    var name: String
    
    // Designed for Null Objects
    
    init() {
        self.backdrop_path = ""
        self.id = 0
        self.poster_path = ""
        self.name = ""
    }
    
    init(backdrop_path: String, id: Int, poster_path: String, name: String) {
        self.backdrop_path = backdrop_path
        self.id = id
        self.poster_path = poster_path
        self.name = name
    }
    
}

struct JSONMovieObject: Identifiable {
    
    var id: Int
    var video: Bool
    var original_language: String
    var overview: String
    var backgrop_path: String
    var adult: Bool
    var vote_count: Int
    var vote_average: Int
    var orginal_title: String
    var release_date: String
    var popularity: Float
    var title: String
    var poster_path: String
    var genre_ids: [Any]
    
    init() {
        self.id = 9999
        self.video = false
        self.original_language = ""
        self.overview = ""
        self.backgrop_path = ""
        self.adult = false
        self.vote_count = 9999
        self.vote_average = 9999
        self.orginal_title = ""
        self.release_date = ""
        self.popularity = 9999.99
        self.title = ""
        self.poster_path = ""
        self.genre_ids = []
    }
    
    init(id: Int, video: Bool, original_language: String, overview: String, backdrop_path: String, adult: Bool, vote_count: Int, vote_average: Int, orginal_title: String, release_date: String, popularity: Float, title: String, poster_path: String, genre_ids: [Any] ) {
        self.id = id
        self.video = video
        self.original_language = original_language
        self.overview = overview
        self.backgrop_path = backdrop_path
        self.adult = adult
        self.vote_count = vote_count
        self.vote_average = vote_average
        self.orginal_title = orginal_title
        self.release_date = release_date
        self.popularity = popularity
        self.title = title
        self.poster_path = poster_path
        self.genre_ids = genre_ids
    }
}

var collection: JSONCollection
var inCollection: Bool = false
var collectionID = 295

var jsonArray: [JSON] = []
var objectArray: [JSONMovieObject] = []
var rowCount: Int = 0
var rowObjectPositions = [[Int]]()


// MARK: - GetObject

private func getObject(positionNumber: Int) -> JSONMovieObject {
    let object = jsonArray[positionNumber]
    let newObject = JSONMovieObject(id: object["id"].int!, video: object["video"].bool!, original_language: object["original_language"].string!, overview: object["overview"].string!, backdrop_path: object["backdrop_path"].string!, adult: object["adult"].bool!, vote_count: object["vote_count"].int!, vote_average: object["vote_average"].int!, orginal_title: object["original_title"].string!, release_date: object["release_date"].string!, popularity: object["popularity"].float!, title: object["title"].string!, poster_path: object["poster_path"].string!, genre_ids: object["genre_ids"].arrayObject!)
//        print("name = \(newObject.title), id = \(newObject.id)")
    return newObject
} // end of getObject

// MARK:- CalculateRowAmount

private func calculateRowAmountandObjectPositions(arrayCount: Int) {
    //RowAmount
    let row = Double(arrayCount) / 3
    let roundedRow = row.rounded(.up)
    let intRow = Int(roundedRow)
    
    //Object Positions
    rowObjectPositions = []
    var n = 0
    var rowGroup: [Int] = []
    for _ in 0..<(intRow) {
        for _ in 0...2 {
            if n < arrayCount {
                rowGroup.append(n)
                
            } // end of if
            n += 1
        } // end of for
        rowObjectPositions.append(rowGroup)
        rowGroup = []
    } // end of for
}

// GetCollectionDetails

func getCollectionDetails(id: Int, completionHandler: @escaping (JSON) -> Void) {
    
    let url = "https://api.themoviedb.org/3/collection/\(id)?api_key=\(API)&language=en-US"
    
    AF.request(url, method: .get).responseJSON { (responce) in
        switch responce.result {
        case .success(let value):
            let json = JSON(value)
            completionHandler(json)
        case .failure(let error):
            print("Error: \(error)")
        }
    }
}

func getMoviesInCollection(completionHander: @escaping () -> Void) {
    getCollectionDetails(id: collectionID) { (response) in
        if response != JSON() {
            jsonArray = response["parts"].arrayValue
            print(jsonArray)
            let count = jsonArray.count
            for (index, _) in jsonArray.enumerated() {
                let temp = getObject(positionNumber: index)
                objectArray.append(temp)
            }
            calculateRowAmountandObjectPositions(arrayCount: count)
            completionHander()
        } else {
            print("responce is empty")
            // TODO
        }
        
    }
}

getMoviesInCollection {
    
}

import Foundation
import Alamofire
import SwiftyJSON
import SwiftUI

let API = "df8304134d840c4d6d11ca3c0055d5c6"

var jsonSearchArray: [JSON] = []
var objectSearchArray: [JSONMovieObject] = []
var searchRowCount: Int = 0
var searchRowObjectPositions = [[Int]]()

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

func search(title: String) {
    let query = convertTitle(title: title)
    searchMovies(query: query) { (responce) in
        if responce != JSON() {
            jsonSearchArray = responce["results"].arrayValue
            let count = jsonSearchArray.count
            for i in 0..<count {
                print(i)
                let temp = getSearchObject(positionNumber: i)
                print(temp)
                objectSearchArray.append(temp)
            }
            print(objectSearchArray)
            
        } else {
            print("search responce empty")
            // TO DO
        }
        
    }
}

// MARK: Convert Title

private func convertTitle(title: String) -> String {
    return title.replacingOccurrences(of: " ", with: "%20")
}

// MARK: - GetSearchObject

private func getSearchObject(positionNumber: Int) -> JSONMovieObject {
    let object = jsonSearchArray[positionNumber]
    var newObject = JSONMovieObject()
    newObject.poster_path = object["poster_path"].string!
    newObject.overview = object["overview"].string!
    newObject.release_date = object["release_date"].string!
    newObject.id = object["id"].int!
    newObject.popularity = object["popularity"].float!
    newObject.title = object["title"].string!
    print("object name: \(newObject.title)")
    return newObject
} // end of getObject

func searchMovies(query: String, completionHandler: @escaping (JSON) -> Void) {
    
    let url = "https://api.themoviedb.org/3/discover/movie?with_watch_providers=390&with_text_query=\(query)&api_key=\(API)"
    
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

search(title: "Pirates")

//
//  SearchController.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 29/07/2021.
//

import SwiftUI
import SwiftyJSON
import CoreData

class searchController: TMDB, ObservableObject {
    
    @Published var jsonDiscoverArray: [JSON] = []
    @Published var objectDiscoverArray: [JSONMovieObject] = []
    @Published var discoverRowCount: Int = 0
    @Published var discoverRowObjectPositions = [[Int]]()
    let controlledDiscoveryArrayCount = 3
    
    @Published var jsonSearchArray: [JSON] = []
    @Published var objectSearchArray: [JSONMovieObject] = []
    @Published var searchRowCount: Int = 0
    @Published var searchRowObjectPositions = [[Int]]()
    
    
    
    override init(moc: NSManagedObjectContext) {
        super.init(moc: moc)
        self.discoverMovies {
            
        }
    }
    
    // MARK:- Search
    
    func search(title: String, completionHander: @escaping () -> Void) {
        let query = convertTitle(title: title)
        super.searchMovies(query: query) { (responce) in
            if responce != JSON() {
                self.jsonSearchArray = responce["results"].arrayValue
                let count = self.jsonSearchArray.count
                for i in 0..<count {
                    let temp = self.getSearchObject(positionNumber: i)
                    self.objectSearchArray.append(temp)
                }
                self.searchCalculateRowAmountandObjectPositions(arrayCount: count)
                completionHander()
                
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
    
    // MARK:- - SearchIsNotEmpty
    
     func searchIsNotEmpty(query: String) -> Bool {
        var bool = false
        if query != "" {
            bool = true
        }
        return bool
    }
    
    // MARK:- SearchCalculateRowAmountandObjectPositions
    
    private func searchCalculateRowAmountandObjectPositions(arrayCount: Int) {
        //RowAmount
        let row = Double(arrayCount) / 3
        let roundedRow = row.rounded(.up)
        let intRow = Int(roundedRow)
        
        //Object Positions
        self.searchRowObjectPositions = []
        var n = 0
        var rowGroup: [Int] = []
        for _ in 0..<(intRow) {
            for _ in 0...2 {
                if n != arrayCount {
                    rowGroup.append(n)
                    
                } // end of if
                n += 1
            } // end of for
            self.searchRowObjectPositions.append(rowGroup)
            rowGroup = []
        } // end of for
    }
    
    // MARK:- DiscoverMovies
    
    func discoverMovies(completionHander: @escaping () -> Void) {
        super.discoverMovies { (responce) in
            if responce != JSON() {
                self.jsonDiscoverArray = responce["results"].arrayValue
                let count = self.controlledDiscoveryArrayCount
                var i = 1
                for (_, _) in self.jsonDiscoverArray.enumerated() {
                    while i != self.controlledDiscoveryArrayCount {
                        let temp = self.getDiscoveryObject(positionNumber: Int.random(in: 0..<count))
                        self.objectDiscoverArray.append(temp)
                        i += 1
                    } 
                }
                self.disoverCalculateRowAmountandObjectPositions(arrayCount: count)
                completionHander()
            } else {
                print("responce is empty - discoverMovies failed")
            }
        }
    }
    
    // MARK:  GetDiscoveryObject

    private func getDiscoveryObject(positionNumber: Int) -> JSONMovieObject {
        let object = self.jsonDiscoverArray[positionNumber]
        let newObject = JSONMovieObject(id: object["id"].int!, video: object["video"].bool!, original_language: object["original_language"].string!, overview: object["overview"].string!, backdrop_path: object["backdrop_path"].string!, adult: object["adult"].bool!, vote_count: object["vote_count"].int!, vote_average: object["vote_average"].int!, orginal_title: object["original_title"].string!, release_date: object["release_date"].string!, popularity: object["popularity"].float!, title: object["title"].string!, poster_path: object["poster_path"].string!, genre_ids: object["genre_ids"].arrayObject!)
        return newObject
    } // end of getObject
    
    // MARK:- DiscoverCalculateRowAmountandObjectPositions
    
    private func disoverCalculateRowAmountandObjectPositions(arrayCount: Int) {
        //RowAmount
        let row = Double(arrayCount) / 3
        let roundedRow = row.rounded(.up)
        let intRow = Int(roundedRow)
        
        //Object Positions
        self.discoverRowObjectPositions = []
        var n = 0
        var rowGroup: [Int] = []
        for _ in 0..<(intRow) {
            for _ in 0...2 {
                if n != arrayCount {
                    rowGroup.append(n)
                    
                } // end of if
                n += 1
            } // end of for
            self.discoverRowObjectPositions.append(rowGroup)
            rowGroup = []
        } // end of for
    }
    
    

    
    
}

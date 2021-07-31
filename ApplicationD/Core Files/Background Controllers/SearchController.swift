//
//  SearchController.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 29/07/2021.
//

import SwiftUI
import SwiftyJSON

class searchController: TMDB, ObservableObject {
    
    @Published var jsonDiscoverArray: [JSON] = []
    @Published var objectDiscoverArray: [JSONMovieObject] = []
    @Published var rowCount: Int = 0
    @Published var rowObjectPositions = [[Int]]()
    let controlledDiscoveryArrayCount = 3
    
    override init() {
        super.init()
        self.discoverMovies {
            
        }
    }
    
    // MARK:- Search
    
    func search(title: String) {
        
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
                        let temp = self.getObject(positionNumber: i - 1)
                        self.objectDiscoverArray.append(temp)
                        i += 1
                    } 
                }
                self.calculateRowAmountandObjectPositions(arrayCount: count)
                completionHander()
            } else {
                print("responce is empty - discoverMovies failed")
            }
        }
    }
    
    // MARK: - GetObject

    private func getObject(positionNumber: Int) -> JSONMovieObject {
        let object = self.jsonDiscoverArray[positionNumber]
        let newObject = JSONMovieObject(id: object["id"].int!, video: object["video"].bool!, original_language: object["original_language"].string!, overview: object["overview"].string!, backdrop_path: object["backdrop_path"].string!, adult: object["adult"].bool!, vote_count: object["vote_count"].int!, vote_average: object["vote_average"].int!, orginal_title: object["original_title"].string!, release_date: object["release_date"].string!, popularity: object["popularity"].float!, title: object["title"].string!, poster_path: object["poster_path"].string!, genre_ids: object["genre_ids"].arrayObject!)
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
                if n != arrayCount {
                    rowGroup.append(n)
                    
                } // end of if
                n += 1
                print(n)
            } // end of for
            rowObjectPositions.append(rowGroup)
            rowGroup = []
        } // end of for
        print(rowObjectPositions)
    }

    
    
}

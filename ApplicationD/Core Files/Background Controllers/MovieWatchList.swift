//
//  MovieWatchList.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 01/05/2021.
//
// Class acts as a backend source for the Movies Watchlist
//


import SwiftyJSON
import SwiftUI

class MovieWatchList: TMDB, ObservableObject {
    
    @Published var watchListArray: [JSON] = []
    @Published var objectArray: [JSONMovieObject] = []
    @Published var rowCount: Int = 0
    @Published var rowObjectPositions = [[Int]]()

    
    // MARK:- init
    override init() {
        super.init()
        loadList {
//            print("completed")
        }
    }
 
    // MARK:- loadList
    
    func loadList(completionHander: @escaping () -> Void) {
        super.getMovieWatchList { (responce) in
            if responce != JSON() {
                self.watchListArray = responce["results"].arrayValue
                let count = self.watchListArray.count
                for (index, _) in self.watchListArray.enumerated() {
                    let temp = self.getObject(positionNumber: index)
                    self.objectArray.append(temp)
                }
                self.calculateRowAmountandObjectPositions(arrayCount: count)
                completionHander()
            } else {
                print("responce is empty")
                // TODO
            }
        } // end of getWatchList
    } // end of loadList
    
    // MARK: - func getObject

    private func getObject(positionNumber: Int) -> JSONMovieObject {
        let object = watchListArray[positionNumber]
        let newObject = JSONMovieObject(id: object["id"].int!, video: object["video"].bool!, original_language: object["original_language"].string!, overview: object["overview"].string!, backdrop_path: object["backdrop_path"].string!, adult: object["adult"].bool!, vote_count: object["vote_count"].int!, vote_average: object["vote_average"].int!, orginal_title: object["original_title"].string!, release_date: object["release_date"].string!, popularity: object["popularity"].float!, title: object["title"].string!, poster_path: object["poster_path"].string!, genre_ids: object["genre_ids"].arrayObject!)
        return newObject
    } // end of getObject
    

    // MARK:- func calculateRowAmount
    
    func calculateRowAmountandObjectPositions(arrayCount: Int) {
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
            } // end of for
            rowObjectPositions.append(rowGroup)
            rowGroup = []
        } // end of for
        print(rowObjectPositions)
    }
    
}

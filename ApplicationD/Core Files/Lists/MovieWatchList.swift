//
//  MovieWatchList.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 01/05/2021.
//
// Class acts as a backend source for the Movies Watchlist
//

import Foundation
import SwiftyJSON
import SwiftUI

class MovieWatchList: TMDB, ObservableObject {
    
    @Published var watchListArray: [JSON] = []
    @Published var objectArray: [JSONMovieObject] = []
    @Published var rowCount: Int = 0
    @Published var rowObjectPositions = [[Int]]()
    
    // MARK: TESTING ONLY VARIABLES
    
    let TESTapi = "df8304134d840c4d6d11ca3c0055d5c6"
    let TESTsessionId = "3ebe85700311a36a740bb1f8cc4efe7b506cd9f4"
    let TESTaccountId = "9909049"
    
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
                print("Watchlist contains \(count) items")
//                print("Downloaded list sucessful")
                for (index, _) in self.watchListArray.enumerated() {
                    //print(index)
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
        print("title: \(newObject.title), position: \(positionNumber), movieID: \(newObject.id)")
        return newObject
    } // end of getObject
    

    // MARK:- func calculateRowAmount
    
    func calculateRowAmountandObjectPositions(arrayCount: Int) {
        //RowAmount
        print("arrayCount = \(arrayCount)")
        let row = Double(arrayCount) / 3
        print("row = \(row)")
        let roundedRow = row.rounded(.up)
        print("Rowedrow = \(roundedRow)")
        let intRow = Int(roundedRow)
        print("intRow = \(intRow)")
        print("arrayCount has converted to \(intRow) rows")
        
        //Object Positions
        rowObjectPositions = []
        var n = 0
        var rowGroup: [Int] = []
        print("arrayCount = \(arrayCount)")
        for i in 0..<(intRow) {
            for _ in 0...2 {
                if n != arrayCount {
                    rowGroup.append(n)
                    
                } // end of if
                n += 1
                print(n)
            } // end of for
            print("round \(i): n = \(n), rowGroup = \(rowGroup)")
            rowObjectPositions.append(rowGroup)
            rowGroup = []
        } // end of for
        print(rowObjectPositions)
    }
    
}

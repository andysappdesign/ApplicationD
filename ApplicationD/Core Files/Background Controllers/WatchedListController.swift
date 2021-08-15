//
//  WatchedListController.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 11/08/2021.
//

import SwiftUI
import CoreData
import SwiftyJSON

class WatchedListController: TMDB, ObservableObject {
    
    @Published var watchedListArray: [JSON] = []
    @Published var objectArray: [JSONMovieObject] = []
    @Published var rowCount: Int = 0
    @Published var rowObjectPositions = [[Int]]()
    
    let points = PointSystem()
    
    override init(){
        super.init()
        loadList {
            
        }
    }
    
    // MARK:- LoadList
    
    func loadList(completionHander: @escaping () -> Void) {
        if UserDefaults.standard.bool(forKey: "listsCreated") == true {
            let id = UserDefaults.standard.integer(forKey: "watchedID")
            let idString = String(id)
            var watchedList: [Int] = []
            if UserDefaults.standard.array(forKey: "watchedList") != nil {
                watchedList = UserDefaults.standard.object(forKey: "watchedList") as! [Int]
            }
            print(id)
            
            super.getListDetails(id: idString) { (responce) in
                print(responce)
                if responce != JSON() {
                    //                    print(responce["items"])
                    self.watchedListArray = responce["items"].arrayValue
                    //                    print(self.watchedListArray)
                    let count = self.watchedListArray.count
                    //                    print("count = \(count)")
                    for (index, _) in self.watchedListArray.enumerated() {
                        let temp = self.getObject(positionNumber: index)
                        self.objectArray.append(temp)
                        watchedList.append(temp.id)
                        let existingPoints = UserDefaults.standard.integer(forKey: "totalPoints")
                        self.points.calculateAndAddPoints(id: temp.id, mediaString: temp.media_type, existingPoints: existingPoints)
                    }
                    self.calculateRowAmountandObjectPositions(arrayCount: count)
                    UserDefaults.standard.setValue(watchedList, forKey: "watchedList")
                    //                    print(watchedList)
                    completionHander()
                } else {
                    print("responce is empty")
                    // TODO
                }
            }
            
        } // end of getWatchList
        
    } // end of loadList
    
    // MARK: - GetObject
    
    private func getObject(positionNumber: Int) -> JSONMovieObject {
        let object = watchedListArray[positionNumber]
        print(object)
        let newObject = JSONMovieObject(id: object["id"].int!, video: object["video"].bool!, original_language: object["original_language"].string!, overview: object["overview"].string!, backdrop_path: object["backdrop_path"].string!, adult: object["adult"].bool!, vote_count: object["vote_count"].int!, vote_average: object["vote_average"].int!, orginal_title: object["original_title"].string!, release_date: object["release_date"].string!, popularity: object["popularity"].float!, title: object["title"].string!, poster_path: object["poster_path"].string!, genre_ids: object["genre_ids"].arrayObject!, media_type: object["media_type"].string ?? "Unknown")
        //        print("name = \(newObject.title), id = \(newObject.id)")
        return newObject
    } // end of getObject
    
    
    // MARK:- CalculateRowAmount
    
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
                if n < arrayCount {
                    rowGroup.append(n)
                    
                } // end of if
                n += 1
            } // end of for
            rowObjectPositions.append(rowGroup)
            rowGroup = []
        } // end of for
    }
    
    // MARK: IsFilmInWatchedList
    
    func isFilmInWatchedList(queryID: Int) -> Bool {
        let list: [Int] = UserDefaults.standard.object(forKey: "watchedList") as! [Int]
        
        if list.contains(queryID) {
            print("\(queryID) is in the watched list")
            return true
        } else {
            print("\(queryID) is not in the watched list")
            return false
        }
        
    }
    
}

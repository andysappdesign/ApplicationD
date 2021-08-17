//
//  CollectionsController.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 08/08/2021.
//

import SwiftUI
import SwiftyJSON

class CollectionsController: TMDB, ObservableObject {
    
    var collection: JSONCollection
    var inCollection: Bool = false
    var collectionID: Int
    var collectionTitle = ""
    
    let watchedListController = WatchedListController()
    
    @Published var jsonArray: [JSON] = []
    @Published var objectArray: [JSONMovieObject] = []
    @Published var rowCount: Int = 0
    @Published var rowObjectPositions = [[Int]]()
    
    // Blank init to only be used by IndervidualInformation
    
    override init() {
        self.collection = JSONCollection()
        self.collectionID = 0
        super.init()
        
    }
    
    init(id: Int) {
        self.collection = JSONCollection()
        self.collectionID = id
        super.init()
    }
    
    // MARK:- GetMovieCollection
    
    func getMovieCollection(id: Int) {     
        getMovieDetailsCollection(id: id) { (response) in
            let object = JSON(response)
            let collectionObject = JSONCollection(backdrop_path: object["backdrop_path"].string ?? "", id: object["id"].int ?? 0, poster_path: object["poster_path"].string ?? "", name: object["name"].string ?? "")
            if collectionObject.name != "" {
                self.collection = collectionObject
                self.collectionID = collectionObject.id
                self.inCollection = true
            } else {
                self.inCollection = false
            }
            
        }
        
    }
    
    // MARK:- GetMoviesInCollection
    
    func getMoviesInCollection(completionHander: @escaping () -> Void) {
        super.getCollectionDetails(id: self.collectionID) { (response) in
            if response != JSON() {
                self.objectArray = []
                self.jsonArray = response["parts"].arrayValue
                for (index, _) in self.jsonArray.enumerated() {
//                    print(index)
                   self.getObject(positionNumber: index) { response in
                   print(response)
                    if response.release_date != "" {
                        self.objectArray.append(response)
                    }
                    }
                }
                let count = self.objectArray.count
                self.calculateRowAmountandObjectPositions(arrayCount: count)
                for i in self.objectArray {
                    print(i.title)
                }
                completionHander()
            } else {
                print("responce is empty")
                // TODO
            }
            
        }
    }
    
    // MARK: - GetObject

    private func getObject(positionNumber: Int, completionHandler: @escaping (JSONMovieObject) -> Void){
        let object = jsonArray[positionNumber]
        var newObject = JSONMovieObject(id: object["id"].int!, video: object["video"].bool!, original_language: object["original_language"].string!, overview: object["overview"].string!, backdrop_path: object["backdrop_path"].string ?? "", adult: object["adult"].bool!, vote_count: object["vote_count"].int!, vote_average: object["vote_average"].int!, orginal_title: object["original_title"].string!, release_date: object["release_date"].string ?? "", popularity: object["popularity"].float!, title: object["title"].string!, poster_path: object["poster_path"].string ?? "", genre_ids: object["genre_ids"].arrayObject!, media_type: object["media_type"].string ?? "unknown")
        if newObject.release_date != "" {
            if watchedListController.isFilmInWatchedList(queryID: newObject.id) {
                newObject.watched = true
            } else {
                newObject.watched = false
            }
            completionHandler(newObject)
        }
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
    
}

//
//  PointSystem.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/05/2021.
//

import Foundation

class PointSystem {
    var media: MediaType = .unknown
    var point_value: Int = 0
    var how_many_min: Int = 0
    var how_many_max: Int = 0
    
    enum MediaType {
        case movieSingle
        case tvProgram
        case tvSeason
        case tvSeasonCollection
        case smallMovieCollection
        case mediumMovieCollection
        case largeMovieCollection
        case unknown
    }
    

    
    // MARK:- calculateMinimum
    
//    private func calculateMinimum() {
//        var minimum = 0
//        switch media {
//        case .movieSingle:
//            minimum = 1
//        case .tvProgram:
//            minimum = 1
//        case .tvSeason:
//            minimum = 1
//        case .tvSeasonCollection:
//            minimum = 2
//        case .smallMovieCollection:
//            minimum = 2
//        case .mediumMovieCollection:
//            minimum = 4
//        case .largeMovieCollection:
//            minimum = 10
//        }
//        self.how_many_min = minimum
//    }
//
//    // MARK:- calculateMaximum
//
//    private func calculateMaximum() {
//        var maximum = 0
//        switch media {
//        case .movieSingle:
//            maximum = 1
//        case .tvProgram:
//            maximum = 1
//        case .tvSeason:
//            maximum = 1
//        case .tvSeasonCollection:
//            maximum = 4
//        case .smallMovieCollection:
//            maximum = 4
//        case .mediumMovieCollection:
//            maximum = 9
//        case .largeMovieCollection:
//            maximum = 99999
//        }
//        self.how_many_max = maximum
//    }
    
    // MARK:- calculatePoints
    
    private func calculatePoints(media: MediaType) {
        var points = 0
        switch media {
        case .movieSingle:
            points = 30
        case .tvProgram:
            points = 5
        case .tvSeason:
            points = 40
        case .tvSeasonCollection:
            points = 100
        case .smallMovieCollection:
            points = 20
        case .mediumMovieCollection:
            points = 50
        case .largeMovieCollection:
            points = 100
        case .unknown:
            points = 0
        }
        self.point_value = points
    }
    
    
    // MARK:- AddPoints
    
    private func addPoints(existingPoints: Int) {
        let new = existingPoints + self.point_value
        print("point value is \(self.point_value)")
        UserDefaults.standard.setValue(new, forKey: "totalPoints")
        print("new total poimts is \(new)")
    }
    
    // MARK: CheckIfAlreadyApplied
    
    private func checkIfAlreadyApplied(id: Int) -> Bool {
        let array: [Int] = UserDefaults.standard.object(forKey: "watchedList") as! [Int]
        
        if array.contains(id) {
            print("\(id) is already in the watched list")
            return true
        } else {
            print ("\(id) is not in the watched list")
            return false
        }
    }
    
    // MARK: AddToUserDefaultsWatchedList
    
    private func addToUserDefaultsWatchedList(id: Int) {
        var array: [Int] = UserDefaults.standard.object(forKey: "watchedList") as! [Int]
        array.append(id)
        UserDefaults.standard.setValue(array, forKey: "watchedList")
        print ("\(id) added to watched list")

    }
    
    // MARK: ConvertStringToMediaType
    
    private func convertStringToMediaType(mediaString: String) -> MediaType {
        var media: MediaType = .unknown
        if mediaString == "movie" {
            media = .movieSingle
        } else if mediaString == "tvProgram" {
            media = .tvProgram
        } else if mediaString == "tvSeason" {
            media = .tvSeason
        } else if mediaString == "tvSeasonCollection" {
            media = .tvSeasonCollection
        }
        else if mediaString == "smallMovieCollection" {
            media = .smallMovieCollection
        }
        else if mediaString == "mediumMovieCollection" {
            media = .mediumMovieCollection
        }
        else if mediaString == "largeMovieCollection" {
        }
        return media
    }
    
    
    // MARK:- CalculateAndAddPoints
    
    func calculateAndAddPoints(id: Int, mediaString: String, existingPoints: Int) {
        if checkIfAlreadyApplied(id: id) == false {
            let media = convertStringToMediaType(mediaString: mediaString)
            calculatePoints(media: media)
            addPoints(existingPoints: existingPoints)
            addToUserDefaultsWatchedList(id: id)
        }
    }
    
    
    
    
}

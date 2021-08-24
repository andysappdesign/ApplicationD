//
//  PointSystem.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/05/2021.
//
//  This file holds the information and function to help controll the points system of the app

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
        UserDefaults.standard.setValue(new, forKey: "totalPoints")
    }
    
    // MARK: CheckIfAlreadyApplied
    
    private func checkIfAlreadyApplied(id: Int) -> Bool {
        let array: [Int] = UserDefaults.standard.object(forKey: "watchedList") as! [Int]
        
        if array.contains(id) {
            return true
        } else {
            return false
        }
    }
    
    // MARK: AddToUserDefaultsWatchedList
    
    private func addToUserDefaultsWatchedList(id: Int) {
        var array: [Int] = UserDefaults.standard.object(forKey: "watchedList") as! [Int]
        array.append(id)
        UserDefaults.standard.setValue(array, forKey: "watchedList")
        
    }
    
    func addRecent(title: String, points: Int) {
        UserDefaults.standard.setValue(title, forKey: "recentTitle")
        UserDefaults.standard.setValue(points, forKey: "recentPoints")
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
        let media = convertStringToMediaType(mediaString: mediaString)
        calculatePoints(media: media)
        if checkIfAlreadyApplied(id: id) == false {
            addPoints(existingPoints: existingPoints)
            addToUserDefaultsWatchedList(id: id)
        }
        
    }
    
    
    
    
}

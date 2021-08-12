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
    
    private func addPoints(existingPoints: Int) -> Int {
        return existingPoints + self.point_value
    }
    
    // MARK:- CalculateAndAddPoints
    
    func calculateAndAddPoints(mediaString: String, existingPoints: Int) -> Int {
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
        calculatePoints(media: media)
        return addPoints(existingPoints: existingPoints)
    }
    
    
    
}

//
//  JSONMovieObject.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 14/07/2021.
//

import SwiftUI

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

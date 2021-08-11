//
//  JSONCollection.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 08/08/2021.
//

import SwiftUI

struct JSONCollection {
    
    var backdrop_path: String
    var id: Int
    var poster_path: String
    var name: String
    
    // Designed for Null Objects
    
    init() {
        self.backdrop_path = ""
        self.id = 0
        self.poster_path = ""
        self.name = ""
    }
    
    init(backdrop_path: String, id: Int, poster_path: String, name: String) {
        self.backdrop_path = backdrop_path
        self.id = id
        self.poster_path = poster_path
        self.name = name
    }
    
}

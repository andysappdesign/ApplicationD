//
//  JSONCastObject.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 20/07/2021.
//
//  This JSON Object can hold a Movie's Cast information

import Foundation

struct JSONCastObject: Identifiable {
    
    let id: Int
    let cast: [castObjects]
    let crew: [castObjects]
}

struct castObjects: Identifiable {
    
    let id: Int
    let name: String
    let profilePicURL: String
    let cast_id: Int
    let character: String
    
}

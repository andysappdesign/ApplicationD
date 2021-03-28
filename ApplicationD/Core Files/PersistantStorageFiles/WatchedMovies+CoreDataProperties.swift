//
//  WatchedMovies+CoreDataProperties.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 28/03/2021.
//
//

import Foundation
import CoreData


extension WatchedMovies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WatchedMovies> {
        return NSFetchRequest<WatchedMovies>(entityName: "WatchedMovies")
    }

    @NSManaged public var title: String
    @NSManaged public var tmdbId: Int
    @NSManaged public var hasBeenWatched: User

}

extension WatchedMovies : Identifiable {

}

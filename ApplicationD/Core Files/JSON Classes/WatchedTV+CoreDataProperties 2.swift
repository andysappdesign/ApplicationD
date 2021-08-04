//
//  WatchedTV+CoreDataProperties.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 28/03/2021.
//
//

import Foundation
import CoreData


extension WatchedTV {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WatchedTV> {
        return NSFetchRequest<WatchedTV>(entityName: "WatchedTV")
    }

    @NSManaged public var epside: Int
    @NSManaged public var season: Int
    @NSManaged public var title: String
    @NSManaged public var tmdbId: Int
    @NSManaged public var hasBeenWatched: User

}

extension WatchedTV : Identifiable {

}

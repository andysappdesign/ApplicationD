//
//  PlannedMovies+CoreDataProperties.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 28/03/2021.
//
//

import Foundation
import CoreData


extension PlannedMovies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlannedMovies> {
        return NSFetchRequest<PlannedMovies>(entityName: "PlannedMovies")
    }

    @NSManaged public var title: String
    @NSManaged public var tmdbId: Int
    @NSManaged public var isPlannedBy: User

}

extension PlannedMovies : Identifiable {

}

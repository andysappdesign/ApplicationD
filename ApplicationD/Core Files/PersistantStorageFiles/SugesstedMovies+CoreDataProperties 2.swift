//
//  SugesstedMovies+CoreDataProperties.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 28/03/2021.
//
//

import Foundation
import CoreData


extension SugesstedMovies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SugesstedMovies> {
        return NSFetchRequest<SugesstedMovies>(entityName: "SugesstedMovies")
    }

    @NSManaged public var title: String
    @NSManaged public var tmdbId: Int
    @NSManaged public var suggestedBy: User
    @NSManaged public var suggestedTo: User

}

extension SugesstedMovies : Identifiable {

}

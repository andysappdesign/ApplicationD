//
//  SugesstedTV+CoreDataProperties.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 28/03/2021.
//
//

import Foundation
import CoreData


extension SugesstedTV {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SugesstedTV> {
        return NSFetchRequest<SugesstedTV>(entityName: "SugesstedTV")
    }

    @NSManaged public var episode: Int
    @NSManaged public var season: Int
    @NSManaged public var title: String
    @NSManaged public var tmdbId: Int
    @NSManaged public var suggestedBy: User
    @NSManaged public var suggestedTo: User

}

extension SugesstedTV : Identifiable {

}

//
//  PlannedTV+CoreDataProperties.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 28/03/2021.
//
//

import Foundation
import CoreData


extension PlannedTV {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlannedTV> {
        return NSFetchRequest<PlannedTV>(entityName: "PlannedTV")
    }

    @NSManaged public var episode: Int
    @NSManaged public var season: Int
    @NSManaged public var title: String
    @NSManaged public var tmbdId: Int
    @NSManaged public var isPlannedBy: User

}

extension PlannedTV : Identifiable {

}

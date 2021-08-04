//
//  ListsID+CoreDataProperties.swift
//  
//
//  Created by Andrew Cumming on 03/08/2021.
//
//

import Foundation
import CoreData


extension ListsID {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListsID> {
        return NSFetchRequest<ListsID>(entityName: "ListsID")
    }

    @NSManaged public var watch: Int
    @NSManaged public var watched: Int
    @NSManaged public var suggestion: Int

}

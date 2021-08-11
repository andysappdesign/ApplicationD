//
//  NextUp+CoreDataProperties.swift
//  
//
//  Created by Andrew Cumming on 11/08/2021.
//
//

import Foundation
import CoreData


extension NextUp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NextUp> {
        return NSFetchRequest<NextUp>(entityName: "NextUp")
    }

    @NSManaged public var nextfilm: Movie?

}

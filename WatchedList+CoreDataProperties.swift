//
//  WatchedList+CoreDataProperties.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 11/08/2021.
//
//

import Foundation
import CoreData


extension WatchedList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WatchedList> {
        return NSFetchRequest<WatchedList>(entityName: "WatchedList")
    }

    @NSManaged public var hasWatched: NSSet?

}

// MARK: Generated accessors for hasWatched
extension WatchedList {

    @objc(addHasWatchedObject:)
    @NSManaged public func addToHasWatched(_ value: Movie)

    @objc(removeHasWatchedObject:)
    @NSManaged public func removeFromHasWatched(_ value: Movie)

    @objc(addHasWatched:)
    @NSManaged public func addToHasWatched(_ values: NSSet)

    @objc(removeHasWatched:)
    @NSManaged public func removeFromHasWatched(_ values: NSSet)

}

extension WatchedList : Identifiable {

}

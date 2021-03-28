//
//  User+CoreDataProperties.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 28/03/2021.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String
    @NSManaged public var firstName: String
    @NSManaged public var hasWatchedAnything: Bool
    @NSManaged public var lastName: String
    @NSManaged public var recentPoints: Int
    @NSManaged public var recentWatchId: Int
    @NSManaged public var recentWatchTitle: String
    @NSManaged public var sessionID: String
    @NSManaged public var totalPoints: Int
    @NSManaged public var userID: UUID
    @NSManaged public var hasBeenSuggestedMovies: SugesstedMovies?
    @NSManaged public var hasBeenSuggestedTV: SugesstedTV?
    @NSManaged public var hasPlannedMovies: PlannedMovies?
    @NSManaged public var hasPlannedTV: PlannedTV?
    @NSManaged public var hasSuggestedMovies: SugesstedMovies?
    @NSManaged public var hasSuggestedTV: SugesstedTV?
    @NSManaged public var hasWatchedMovies: WatchedMovies?
    @NSManaged public var hasWatchedTV: WatchedTV?
    @NSManaged public var isFreinds: User?

}

extension User : Identifiable {

}

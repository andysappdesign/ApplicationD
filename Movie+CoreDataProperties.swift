//
//  Movie+CoreDataProperties.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 11/08/2021.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var adult: Bool
    @NSManaged public var backgrop_path: String?
    @NSManaged public var id: Int64
    @NSManaged public var orginal_title: String?
    @NSManaged public var original_language: String?
    @NSManaged public var overview: String?
    @NSManaged public var popularity: Float
    @NSManaged public var poster_path: String?
    @NSManaged public var release_date: String?
    @NSManaged public var title: String?
    @NSManaged public var video: Bool
    @NSManaged public var vote_count: Int64
    @NSManaged public var watched: Bool
    @NSManaged public var hasBeenWatched: WatchedList?
    @NSManaged public var toBeWatched: NextUp?

}

extension Movie : Identifiable {

}

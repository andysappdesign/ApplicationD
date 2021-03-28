//
//  userCreationHelper.swift
//  Application D
//
//  Created by Andrew Cumming on 28/03/2021.
//

import Foundation
import SwiftUI
import CoreData

public class userCreationHelper: ObservableObject {

    let user: User
    @Published var screencount = 1
    
    
    // MARK: -  init
    init(moc: NSManagedObjectContext) {
        self.user = User.init(context: moc)
    }
    
    func createUserProfile(first: String, second: String, email: String) {
        user.firstName = first
        user.lastName = second
        user.email = email
        user.userID = UUID()
        user.recentPoints = 0
        user.totalPoints = 0
        user.recentWatchId = 0
        user.sessionID = ""
        user.hasWatchedAnything = false
        print("user \(user.userID) created, firstName = \(user.firstName), lastName = \(user.lastName), email = \(user.email)")
    }
    
    func updateSessionId(_ id : String) {
        user.sessionID = id
        print("updated user id to \(user.sessionID)")
    }
    
    
    
    
}

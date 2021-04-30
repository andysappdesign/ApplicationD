//
//  userCreationHelper.swift
//  Application D
//
//  Created by Andrew Cumming on 28/03/2021.
//

import Foundation
import SwiftUI
import CoreData
import Alamofire
import SwiftyJSON

public class userCreationHelper: ObservableObject {
    
    // This class is just a backend helper class to help with user creation

    let user: User
    let moc: NSManagedObjectContext
    @Published var screencount = 1
    @Published var alertBool = false
    @Published var alertString = ""
    @Published var requestId = ""
    
    
    // MARK: -  init
    init(moc: NSManagedObjectContext) {
        self.user = User.init(context: moc)
        self.moc = moc
    }
    
    // MARK: - func createUserProfile
    // Currently this is only checking to make sure that first, second name and email are not
    // blank before creating a user. This does not make usre the email is valid
    
    func createUserProfile(first: String, second: String, email: String) {
        if first != "" {
            if second != "" {
                if email != "" {
                    submitDetails(first: first, second: second, email: email)
                    screencount = 2
                } else {
                    alertString = "Please enter a email address"
                    alertBool = true
                    print("Error no email")
                }
            } else {
                alertString = "Please enter a second name"
                alertBool = true
                print("Error no second name")
            }
        } else {
            alertString = "Please enter a first name"
            alertBool = true
            print("Error no first name")
        }
        
    }
    
    // MARK: - func updateSessionId
    
    private func updateSessionId(_ id : String) {
        user.sessionID = id
        print("updated user id to \(user.sessionID)")
    }
    
    // MARK: - private func sumbitDetails
    
    private func submitDetails(first: String, second: String, email: String) {
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
    
    // MARK: - func request
    
    func request() {
        let url = "https://api.themoviedb.org/3/authentication/token/new?api_key=df8304134d840c4d6d11ca3c0055d5c6"
        var returnValue = ""
        
        AF.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                returnValue = json["request_token"].stringValue
                print("returnValue = \(returnValue)")
                self.requestId = returnValue
            case .failure(let error):
                print(error)
                self.requestId = ""
            }
        } // end of request
    } // end of requestToken
    
    // MARK: - func createSession
    
    private func createSession() -> JSON {
        let url = "https://api.themoviedb.org/3/authentication/session/new?api_key=df8304134d840c4d6d11ca3c0055d5c6"
        let parameter : [String: String] = [
            "request_token" : requestId
        ]
        var sessionId = JSON()
        
        AF.request(url, method: .post, parameters: parameter).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                sessionId = JSON(value)
                print("success")
            case .failure(let error):
                print("Error \(error)")
            }
        }
        return sessionId
    } // end of createSession
    
    // MARK: func finishSetup
    
    func finishSetup() {
        let sessionIdJSON = createSession()
        let sessionIdString = sessionIdJSON.rawString()
        if sessionIdString != "" {
            updateSessionId(sessionIdString!)
            try? self.moc.save()
            print("User setup complete")
        } else {
            print("can not complete setup; session Id was empty")
        }
        
        
    }
}

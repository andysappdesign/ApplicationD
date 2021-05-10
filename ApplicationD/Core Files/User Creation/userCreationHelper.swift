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

    let moc: NSManagedObjectContext
    @Published var screencount = 1
    @Published var alertBool = false
    @Published var alertString = ""
    @Published var requestId = ""
    @Binding var isOnboarding: Bool
    
    
    // MARK: -  init
    init(moc: NSManagedObjectContext, Onboarded: Binding<Bool>) {
        self._isOnboarding = Onboarded
        self.moc = moc
       
    }
    
    // MARK: - func createUserProfile
    // Currently this is only checking to make sure that first, second name and email are not
    // blank before creating a user. This does not make usre the email is valid
    
    func createUserProfile(first: String, second: String, email: String) {
        if first != "" {
            if second != "" {
                if email != "" {
                    submitDetails(first: first, last: second, email: email)
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
    
    // MARK: - private func sumbitDetails
    
    private func submitDetails(first: String, last: String, email: String) {
        let userId = "\(UUID())"
        UserDefaults.standard.setValue(first, forKey: "firstName")
        UserDefaults.standard.setValue(last, forKey: "lastName")
        UserDefaults.standard.setValue(email, forKey: "email")
        UserDefaults.standard.setValue(userId, forKey: "userId")
        UserDefaults.standard.setValue(0, forKey: "recentPoints")
        UserDefaults.standard.setValue(0, forKey: "totalPoints")
        UserDefaults.standard.setValue(0, forKey: "recentWatchId")
        UserDefaults.standard.setValue(false, forKey: "hasWatchedAnything")
//        print("user \(UserDefaults.standard.string(forKey: "userId")) created, firstName = \(UserDefaults.standard.string(forKey: "firstName")), lastName = \(UserDefaults.standard.string(forKey: "lastName")), email = \(UserDefaults.standard.string(forKey: "email"))")
    }
    
    // MARK: - func request
    
    func request() {
        let url = "https://api.themoviedb.org/3/authentication/token/new?api_key=df8304134d840c4d6d11ca3c0055d5c6"
        var returnValue = ""
        
        AF.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                returnValue = json["request_token"].stringValue
//                print("returnValue = \(returnValue)")
                self.requestId = returnValue
            case .failure(let error):
                print(error)
                self.requestId = ""
            }
        } // end of request
    } // end of requestToken
    
    // MARK: func finishSetup
    
    func finishSetup() {
        createSession()
        self.isOnboarding.toggle() 
        print("User setup complete")
    }
    
    // MARK: - func createSession
    
    private func createSession() {
        let url = "https://api.themoviedb.org/3/authentication/session/new?api_key=df8304134d840c4d6d11ca3c0055d5c6"
        let parameter : [String: String] = [
            "request_token" : requestId
        ]
        
        AF.request(url, method: .post, parameters: parameter).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let sessionId = json["session_id"].stringValue
//                print("success, id = \(sessionId)")
                self.updateSessionId(sessionId)
                self.getTMDbAccount(sessionId)
            case .failure(let error):
                print("Error \(error)")
            }
        }
    } // end of createSession
    
    // MARK: - func updateSessionId
    
    private func updateSessionId(_ id : String) {
        UserDefaults.standard.setValue(id, forKey: "sessionId")
        print("updated user id to \(UserDefaults.standard.string(forKey: "sessionId") ?? ". Error: No ID found")")
    }
    
    //MARK: - func getTMDbAccount
    
    private func getTMDbAccount(_ id: String) {
        let partUrl = "https://api.themoviedb.org/3/account?api_key=df8304134d840c4d6d11ca3c0055d5c6&session_id="
        let sessionId = id
        let url = partUrl + sessionId
        
        AF.request(url, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                let json = JSON(value)
                let accoundId = json["id"].stringValue
                print("accountId: \(accoundId)")
                UserDefaults.standard.setValue(accoundId, forKey: "accountId")
            case .failure(let error):
                print(error)
            }
  
        }
        
    } // end of getTMDbAccount
    
}

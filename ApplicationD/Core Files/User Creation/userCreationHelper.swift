//
//  userCreationHelper.swift
//  Application D
//
//  Created by Andrew Cumming on 28/03/2021.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

 class userCreationHelper: TMDB, ObservableObject {
    
    // This class is just a backend helper class to help with user creation
    @Published var screencount = 1
    @Published var alertBool = false
    @Published var alertString = ""
    @Published var restartBool = false
    @Published var restartString = "Please resart the app for changed to take affect"
    @Binding var isOnboarding: Bool
    @Published var requestIDRecived: Bool = false
    
    
    // MARK: -  init
    init(Onboarded: Binding<Bool>) {
        self._isOnboarding = Onboarded
        super.init()
       
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
        let array: [Int] = []
        UserDefaults.standard.setValue(first, forKey: "firstName")
        UserDefaults.standard.setValue(last, forKey: "lastName")
        UserDefaults.standard.setValue(email, forKey: "email")
        UserDefaults.standard.setValue(userId, forKey: "userId")
        UserDefaults.standard.setValue(0, forKey: "recentPoints")
        UserDefaults.standard.setValue(0, forKey: "totalPoints")
        UserDefaults.standard.setValue(0, forKey: "recentWatchId")
        UserDefaults.standard.setValue(false, forKey: "hasWatchedAnything")
        UserDefaults.standard.setValue(false, forKey: "listsCreated")
        UserDefaults.standard.setValue(0, forKey: "watchID")
        UserDefaults.standard.setValue(0, forKey: "watchedID")
        UserDefaults.standard.setValue(0, forKey: "suggestionID")
        UserDefaults.standard.setValue(array, forKey: "watchedList")
        UserDefaults.standard.setValue("No item watched", forKey: "recentTitle")
        UserDefaults.standard.setValue(0, forKey: "recentPoints")
//        print("user \(UserDefaults.standard.string(forKey: "userId")) created, firstName = \(UserDefaults.standard.string(forKey: "firstName")), lastName = \(UserDefaults.standard.string(forKey: "lastName")), email = \(UserDefaults.standard.string(forKey: "email"))")
    }
    
    // MARK:- func finishSetup
    
    func finishSetup() {
        super.createSession() { (responce) in
            if responce == true {
                self.restartBool.toggle()
                self.isOnboarding.toggle()
                print("User setup complete")
            } else {
                print("User Setup failed")
            }
        
        }
        
    }
    
    // MARK:- request
    
    func request() {
        super.tokenRequest() { (responce) in
            if responce == true {
                self.requestIDRecived = true
            } else {
                print("request has failed")
                self.requestIDRecived = false
            }
        }
    }
    
}

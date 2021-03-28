//
//  UserSetup.swift
//  Application D
//
//  Created by Andrew Cumming on 25/03/2021.
//

import SwiftUI

struct UserSetup: View {
   
    @ObservedObject var Helper = UserSetupHelper.init()
    
    var body: some View {
        VStack {
            Text("Guest Setup")
            Button(action: {
                Helper.request()
            }) {
                Text("Request Token")
            }
            if Helper.id != "" {
                NavigationLink(destination: AuthenticateWindow(id: Helper.id)) {
                    Text("Auth")
                }
            }
            Button(action: {
                Helper.createSession()
            }) {
                Text("Create Session")
            }
            
            
            

        }
    }

    
} // end of UserSetup

// MARK: - UserSetup_Prviews

struct UserSetup_Previews: PreviewProvider {
    static var previews: some View {
        UserSetup()
    }
}

//
//  userCreation2.swift
//  Application D
//
//  Created by Andrew Cumming on 28/03/2021.
//

import SwiftUI

struct userCreation2: View {
    
    // This structure is the second user creation screen's
    // GUI.
    
    @ObservedObject var helper: userCreationHelper
    
    var body: some View {
        NavigationView {
            VStack {
                Text("User Setup")
                Button(action: {
                    helper.request()
                }) {
                    Text("Request Token")
                }
                if helper.requestId != "" {
                    List {
                        NavigationLink(destination: AuthenticateWindow(id: helper.requestId)) {
                            Text("Auth")
                        }
                    }
                }
                Button(action: {
                    helper.finishSetup()
                }) {
                    Text("Create Session")
                }.alert(isPresented: $helper.restartBool, content: {
                            Alert(title: Text("Please resart the app for the changes to take affect"))
                    
                })
            }
            
        }
    }
}

//struct userCreation2_Previews: PreviewProvider {
//    static var previews: some View {
//                let app = ApplicationDApp()
//                let context = app.persistenceController.container.viewContext
//                Group {
//                    userCreation2(helper: userCreationHelper.init(moc: context))
//                        .previewDevice("iPhone 12")
//                    userCreation2(helper: userCreationHelper.init(moc: context))
//                        .previewDevice("iPod touch (7th generation)")
//                }
//    }
//}

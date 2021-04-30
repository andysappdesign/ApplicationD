//
//  userCreation1.swift
//  Application D
//
//  Created by Andrew Cumming on 28/03/2021.
//

import SwiftUI

struct userCreation1: View {
    
    // This structure is the first user creation screen's
    // GUI.
    
    @ObservedObject var helper: userCreationHelper
    
    @State var firstName: String = ""
    @State var secondName: String = ""
    @State var email: String = ""
    
    var body: some View {
        VStack {
            Form() {
                Section() {
                    Text("Frist Name:")
                    TextField("Mike", text: $firstName).padding().textFieldStyle(RoundedBorderTextFieldStyle()).multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                }
                Section() {
                    Text("Second Name:")
                    TextField("Wazowski", text: $secondName).padding().textFieldStyle(RoundedBorderTextFieldStyle()).multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                }
                
                Section() {
                    Text("Email:")
                    TextField("mike@appleseed.com", text: $email).padding().textFieldStyle(RoundedBorderTextFieldStyle()).multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                }
               
            } // end of form
            Button (action: {
                helper.createUserProfile(first: self.firstName, second: self.secondName, email: self.email)
            }) {
                Text("Create My Profile")
                    .multilineTextAlignment(.center)
            }.alert(isPresented: $helper.alertBool, content: {
                Alert(title: Text("Error"), message: Text("\(helper.alertString)"), dismissButton: .default(Text("OK")))
            })
            
        }
      
    }
}

struct userCreation1_Previews: PreviewProvider {
    static var previews: some View {
        let app = ApplicationDApp()
        let context = app.persistenceController.container.viewContext
        Group {
            userCreation1(helper: userCreationHelper.init(moc: context))
                .previewDevice("iPhone 12")
            userCreation1(helper: userCreationHelper.init(moc: context))
                .previewDevice("iPod touch (7th generation)")
        }
    }
}

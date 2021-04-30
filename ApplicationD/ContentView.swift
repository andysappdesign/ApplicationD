//
//  ContentView.swift
//  Application D
//
//  Created by Andrew Cumming on 16/03/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: userCreationMain(managedObjectContext: self.moc)) {
                    Text("User Creation")
                }
                Spacer()
                NavigationLink(destination: Admin(moc: self.moc)) {
                    Text("Admin")
                }
            }
        
        }
        
        

    }
    
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}


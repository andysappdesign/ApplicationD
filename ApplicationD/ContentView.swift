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
            NavigationLink(destination: userCreationMain(managedObjectContext: moc)) {
                Text("User Creation")
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

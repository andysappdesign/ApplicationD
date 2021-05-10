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
    @AppStorage("_isOnboarding") var isOnboarding: Bool = true

    
    var body: some View {
        NavigationView {
            VStack {
                Text("You are on the main app!")
                
            }
        
        }
        .fullScreenCover(isPresented: $isOnboarding, content: {
            Onboarding(hasCompletedOnboarding: $isOnboarding, managedObjectContext: self.moc)
        })

    }
    
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPod touch (7th generation)")
            ContentView()
                .previewDevice("iPhone 12 Pro Max")
                
        }
    }
}


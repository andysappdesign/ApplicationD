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
    
    var name: String

    init() {
        name = UserDefaults.standard.string(forKey: "firstName") ?? "User"
    }

    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("#ECF39E").edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Welcome \(self.name)")
                        .font(.largeTitle)
                        .fontWeight(.regular)
                    Spacer()
                    HStack  {
                        Text("poster")
                        Spacer()
                    }
                    Spacer()
                    Button_Row(button1Text: "My Wall", button2Text: "My Profile")
                    Spacer()
                    
                    
                } // end of VStack
            } // end of Zstack
        } // end of NavigationView
        .fullScreenCover(isPresented: $isOnboarding, content: {
            Onboarding(hasCompletedOnboarding: $isOnboarding, managedObjectContext: self.moc)
        }) // end of fullScreenCover
    }
} // end of view
    


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


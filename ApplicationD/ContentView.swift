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
    
    let GUISize = GUISizes()
    
    var name: String
    var nextFilmString: String = "Luca"
    var nextFilmImageString: String = "piratesMoviePoster"
    

    init() {
        name = UserDefaults.standard.string(forKey: "firstName") ?? "User"
    }

    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("#ECF39E").edgesIgnoringSafeArea(.all)
                VStack {
                    Text("My Home")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    HStack {
                        Text("Welcome \(self.name)")
                            .font(.title)
                            .fontWeight(.regular)
                            .padding(.leading)
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 30)
                    HStack  {
                        Spacer()
                        MoviePoster(size: .large, imageString: self.nextFilmImageString)
                            .padding(.leading)
                        Spacer()
                        VStack {
                            Spacer()
                            Text("Next to watch on my list is \(self.nextFilmString)")
                            Spacer()
                                .frame(height: 30)
                            customButtonLayout(text: "My Lists")
                        }
                        .padding(.trailing)
                        .frame(height: GUISize.largePosterHeight)
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
            ContentView()
                .previewDevice("iPod touch (7th generation)")
        
    }
}


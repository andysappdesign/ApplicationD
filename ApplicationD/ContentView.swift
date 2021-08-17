//
//  ContentView.swift
//  Application D
//
//  Created by Andrew Cumming on 16/03/2021.
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @AppStorage("_isOnboarding") var isOnboarding: Bool = true
    
    let GUISize = GUISizes()
    
    var name: String
    var nextFilmString: String = "Luca"
    var nextFilmImageString: String = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/z8onk7LV9Mmw6zKz4hT6pzzvmvl.jpg"
    
    static var colourString = "#ECF39E"
    

    init() {
        name = UserDefaults.standard.string(forKey: "firstName") ?? "User"
    }

    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color(ContentView.colourString).edgesIgnoringSafeArea(.all)
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
                        MoviePoster(size: .large, urlString: self.nextFilmImageString)
                            .padding(.leading)
                        Spacer()
                        VStack {
                            Spacer()
                            Text("Next to watch on my list is \(self.nextFilmString)")
                            Spacer()
                                .frame(height: 30)
                            NavigationLink(
                                destination: ListView().environment(\.managedObjectContext, self.managedObjectContext)
                            ) {
                                CustomButtonLayout(size: .medium, text: "My Lists")
                            }
                        }
                        .padding(.trailing)
                        .frame(height: GUISize.largePosterHeight)
                    }
                    Spacer()
                    ButtonRowOneInactive(button1Text: "My Wall", button2Text: "My Profile")
                    Spacer()
                    bottomBar()
                    
                    
                } // end of VStack
            } // end of Zstack
            .navigationBarTitleDisplayMode(.inline)
        } // end of NavigationView
        .fullScreenCover(isPresented: $isOnboarding, content: {
            Onboarding(hasCompletedOnboarding: $isOnboarding)
        }) // end of fullScreenCover
    }
} // end of view

// MARK:- extension UINavigationController

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let standard = UINavigationBarAppearance()
        standard.backgroundColor = UIColor(Color("#31572c"))
        
        let compact = UINavigationBarAppearance()
        compact.backgroundColor = UIColor(Color("#31572c"))
        
        let scrollEdge = UINavigationBarAppearance()
        scrollEdge.backgroundColor = UIColor(Color("#31572c"))
        
        navigationBar.standardAppearance = standard
        navigationBar.compactAppearance = compact
        navigationBar.scrollEdgeAppearance = scrollEdge
        
        
    } // End of viewDidLoad
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
                .previewDevice("iPod touch (7th generation)")
        
    }
}


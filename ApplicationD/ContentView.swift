//
//  ContentView.swift
//  Application D
//
//  Created by Andrew Cumming on 16/03/2021.
//
//  This view is the main view of the app and is displayed first when the app is opened

import SwiftUI
import CoreData

let GUISize = GUISizes()

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @AppStorage("_isOnboarding") var isOnboarding: Bool = true
    
    var name: String = UserDefaults.standard.string(forKey: "firstName") ?? "User"
    var nextFilmString = UserDefaults.standard.string(forKey: "nextWatchTitle") ?? "Steamboat Willie"
    var nextFilmImageString = UserDefaults.standard.string(forKey: "nextWatchPoster") ?? "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/2UoMRgHgyg9SeANeUdMyxtTxyxe.jpg"
    
    static var colourString = "#ECF39E"
    
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
                        VStack(alignment: .leading) {
                            Spacer()
                            Text("Next to watch on my list is \(self.nextFilmString)")
                                .font(.body)
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)
                            Spacer()
                                .frame(height: 30)
                            NavigationLink(
                                destination: ListView()
                            ) {
                                CustomButtonLayout(size: .medium, text: "My Lists")
                            }
                        }
                        .padding(.trailing)
                        .frame(height: GUISize.largePosterHeight)
                    }
                    Spacer()
                    ButtonRowHome()
                    Spacer()
                    BottomBar()
                    
                    
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


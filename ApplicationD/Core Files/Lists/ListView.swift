//
//  ListView.swift
//  
//
//  Created by Andrew Cumming on 01/05/2021.
//
// This View acts as a template for the Lists
//

import SwiftUI
import CoreData

struct ListView: View {
    
    @ObservedObject var watchList: WatchlistController
    
    
    init() {
        self.watchList = WatchlistController()
        
    }
    
    var body: some View {
        ZStack {
            Color(ContentView.colourString).edgesIgnoringSafeArea(.all)
            VStack {
                NavigationLink(
                    destination: MovieWatchList(Movie: self.watchList),
                    label: {
                        Text("Watch List")
                })
                Spacer()
                bottomBar()
            }
            
                
        }
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}

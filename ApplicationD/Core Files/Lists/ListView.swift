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
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    init() {
        self.watchList = WatchlistController()
        
    }
    
    var body: some View {
        ZStack {
            Color(ContentView.colourString).edgesIgnoringSafeArea(.all)
            VStack {
                NavigationLink(
                    destination: MovieWatchList(Movie: self.watchList).environment(\.managedObjectContext, self.managedObjectContext),
                    label: {
                        Text("Watch List")
                })
                Spacer()
                bottomBar()
            }
            
                
        }.onAppear(perform: {
            watchList.createOrNot()
        })
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}

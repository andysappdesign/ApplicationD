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
    
    @ObservedObject var watchList: MovieWatchList
    let moc: NSManagedObjectContext
    
    
    init(moc: NSManagedObjectContext) {
        self.moc = moc
        self.watchList = MovieWatchList(moc: moc)
        watchList.loadList {
        }
        
    }
    
    var body: some View {
        ZStack {
            Color(ContentView.colourString).edgesIgnoringSafeArea(.all)
            VStack {
                NavigationLink(
                    destination: WatchList(Movie: self.watchList, moc: self.moc),
                    label: {
                        Text("Watch List")
                })
                Spacer()
                bottomBar(moc: self.moc)
            }
            
                
        }
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}

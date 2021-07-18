//
//  ListView.swift
//  
//
//  Created by Andrew Cumming on 01/05/2021.
//
// This View acts as a template for the Lists
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var watchList: MovieWatchList
    
    init() {
        self.watchList = MovieWatchList()
        watchList.loadList {
           // print("generated list")
        }
    }
    
    var body: some View {
        ZStack {
            Color(ContentView.colourString).edgesIgnoringSafeArea(.all)
            NavigationLink(
                destination: WatchList(Movie: self.watchList),
                label: {
                    Text("Watch List")
            })
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

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
            VStack {
                NavigationLink(
                    destination: WatchList(Movie: self.watchList),
                    label: {
                        Text("Watch List")
                })
                Spacer()
//                NavigationLink(
//                    destination: Indervidual_Information(overview: "Jack Sparrow, a freewheeling 18th-century pirate, quarrels with a rival pirate bent on pillaging Port Royal. When the governor's daughter is kidnapped, Sparrow decides to help the girl's love save her."),
//                    label: {
//                        Text("Information")
//                    }
//                    )
            }
            
                
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

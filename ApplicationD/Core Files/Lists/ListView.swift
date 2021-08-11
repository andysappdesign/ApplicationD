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
    
    let GUISize = GUISizes()
    
    
    init() {
        self.watchList = WatchlistController()
        
    }
    
    var body: some View {
        ZStack {
            Color(ContentView.colourString).edgesIgnoringSafeArea(.all)
            VStack {
                Text("My Lists")
                    .font(GUISize.titleFont)
                    .fontWeight(GUISize.titleWeight)
                    .foregroundColor(GUISize.titleColor)
                    .shadow(color: GUISize.titleShadowColor, radius: GUISize.titleShadowRadius, x: GUISize.titleShadowX, y: GUISize.titleShadowY)
                Spacer()
                NavigationLink(
                    destination: MovieWatchList(Movie: self.watchList),
                    label: {
                        Text("My Watch List")
                })
                Spacer()
                NavigationLink(destination: WatchedListView()) {
                    Text("My Watched List")
                }
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

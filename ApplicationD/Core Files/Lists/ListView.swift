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
    @ObservedObject var watchedList: WatchedListController
    
    let GUISize = GUISizes()
    var buttonSpacerSize: CGFloat
    
    
    init() {
        self.watchList = WatchlistController()
        self.watchedList = WatchedListController()
        self.buttonSpacerSize = GUISize.screenHeight / 15
        
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
                    .frame(height: self.buttonSpacerSize * 2)
                NavigationLink(
                    destination: MovieWatchList(Movie: self.watchList),
                    label: {
                        CustomButtonLayout(size: .large, text: "My Watch List")
                })
                Spacer()
                    .frame(height: self.buttonSpacerSize)
                NavigationLink(destination: WatchedListView()) {
                    CustomButtonLayout(size: .large, text: "My Watched List")
                }
                Spacer()
                    .frame(height: self.buttonSpacerSize)
                // Suggested List link would go here
                CustomButtonLayout(size: .large, text: "My Suggested List", inActive: true)
                Spacer()
                bottomBar()
            }
            
                
        }.onAppear(perform: {
            watchList.loadLists { responce in
                if responce == true {
                    watchList.loadList {
                        
                    }
                    watchedList.loadList {
                        
                    }
                }
                
            }
        })
        .alert(isPresented: $watchList.restartBool, content: {
            Alert(title: Text("Please resart the app for changes to take affect"))
        })
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

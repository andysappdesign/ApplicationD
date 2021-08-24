//
//  WatchList.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 14/07/2021.
//
//  This view creats the Watch List for Movies, using the WatchListController

import SwiftUI

struct MovieWatchList: View {
    
    let Movie: WatchlistController
    // let TV = TVWatchList()
    
    init(Movie: WatchlistController) {
        self.Movie = Movie
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                Color("#ECF39E")
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: GUISize.screenWidth, height: GUISize.screenHeight * 2)
                ScrollView {
                    Text("My Watch List")
                        .font(GUISize.dynamicTitleFont)
                        .fontWeight(GUISize.titleWeight)
                        .foregroundColor(GUISize.titleColor)
                        .shadow(color: GUISize.titleShadowColor, radius: GUISize.titleShadowRadius, x: GUISize.titleShadowX, y: GUISize.titleShadowY)
                    ForEach(Movie.rowObjectPositions, id: \.self) { array in
                        if array.count == 3 {
                            WatchListThreePosterRow(object1: array[0], object2: array[1], object3: array[2], MoviesWatchList: self.Movie)
                        } else if array.count == 2 {
                            WatchListThreePosterRow(object1: array[0], object2: array[1], MoviesWatchList: self.Movie)
                        } else if array.count == 1 {
                            WatchListThreePosterRow(object1: array[0], MoviesWatchList: self.Movie)
                        }
                    }
                }
                VStack {
                    
                    Spacer()
                    BottomBar()
                } //end of VStack
                .onAppear(perform: {
                    Movie.loadList(){
                        
                    }
                })
            } // end of ZStack
            
        } // end of ScrollView
        BottomBar()
        
    } // end of view
}

//struct WatchList_Previews: PreviewProvider {
//    static var previews: some View {
//        WatchList(testing: true)
//    }
//}

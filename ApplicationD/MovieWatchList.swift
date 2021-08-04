//
//  WatchList.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 14/07/2021.
//

import SwiftUI
import CoreData

struct MovieWatchList: View {
    
    let GUISize = GUISizes()
    let moc: NSManagedObjectContext
    @ObservedObject var Movie: MovieWatchList
    // let TV = TVWatchList()
    
    init(Movie: MovieWatchList, moc: NSManagedObjectContext) {
        self.moc = moc
        self.Movie = Movie
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                Color("#ECF39E")
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: GUISize.screenWidth, height: GUISize.screenHeight * 2)
                VStack {
                    ForEach(Movie.rowObjectPositions, id: \.self) {array in
                        if array.count == 3 {
                            WatchListThreePosterRow(object1: array[0], object2: array[1], object3: array[2], MoviesWatchList: self.Movie, moc: self.moc)
                        } else if array.count == 2 {
                            WatchListThreePosterRow(object1: array[0], object2: array[1], MoviesWatchList: self.Movie, moc: self.moc)
                        } else if array.count == 1 {
                            WatchListThreePosterRow(object1: array[0], MoviesWatchList: self.Movie, moc: self.moc)
                        }
                        
                    }
                    Spacer()
                } //end of VStack
            } // end of ZStack
        } // end of ScrollView
        bottomBar(moc: self.moc)
    } // end of view
}

//struct WatchList_Previews: PreviewProvider {
//    static var previews: some View {
//        WatchList(testing: true)
//    }
//}

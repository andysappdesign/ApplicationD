//
//  WatchList.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 14/07/2021.
//

import SwiftUI

struct WatchList: View {
    
    let GUISize = GUISizes()
    @ObservedObject var Movie: MovieWatchList
    // let TV = TVWatchList()

    var body: some View {
        ZStack {
            Color.red
                .edgesIgnoringSafeArea(.top)
            List{
                ForEach(Movie.rowObjectPositions, id: \.self) { array in
                    if array.count == 3 {
                        threePosterRow(object1: array[0], object2: array[1], object3: array[2], MoviesWatchList: self.Movie)
                    } else if array.count == 2 {
                        threePosterRow(object1: array[0], object2: array[1], MoviesWatchList: self.Movie)
                    } else if array.count == 1 {
                        threePosterRow(object1: array[0], MoviesWatchList: self.Movie)
                    }
                    
                }.background(Color(ContentView.colourString))
                
            }
        }
    }
}


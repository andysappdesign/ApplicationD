//
//  WatchList.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 14/07/2021.
//

import SwiftUI

struct WatchList: View {
    
    let GUISize = GUISizes()
    @ObservedObject var Movie = MovieWatchList()
    // let TV = TVWatchList()
    

    var body: some View {
        List{
            ForEach(Movie.rowObjectPositions, id: \.self) { array in
                threePosterRow(object1: array[0], object2: array[1], object3: array[2], MoviesWatchList: self.Movie)
            }
        }
        
        
    }
}

//struct WatchList_Previews: PreviewProvider {
//    static var previews: some View {
//        WatchList()
//    }
//}

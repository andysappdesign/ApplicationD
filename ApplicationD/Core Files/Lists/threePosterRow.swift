//
//  threePosterRow.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 14/07/2021.
//

import SwiftUI

struct threePosterRow: View {
    
    init(object1: Int, object2: Int, object3: Int, MoviesWatchList: MovieWatchList) {
        self.object1 = MoviesWatchList.objectArray[object1]
        if MoviesWatchList.objectArray.count >= (object2 + 1) {
            self.object2 = MoviesWatchList.objectArray[object2]
        } else {
            self.object2 = JSONObject()
        }
        if MoviesWatchList.objectArray.count >= (object3 + 1) {
            self.object3 = MoviesWatchList.objectArray[object3]
        } else {
            self.object3 = JSONObject()
        }
        
    }
    
    let object1: JSONObject
    let object2: JSONObject?
    let object3: JSONObject?
    
    var body: some View {
        HStack {
            VStack {
                MoviePoster(size: .small, imageString: "piratesMoviePoster")
                Text(object1.title)
            }
            VStack {
                MoviePoster(size: .small, imageString: "piratesMoviePoster")
                Text(object2?.title ?? "")
            }
            VStack {
                MoviePoster(size: .small, imageString: "piratesMoviePoster")
                Text(object3?.title ?? "")
            }
        }
    }
}

//struct threePosterRow_Previews: PreviewProvider {
//    static var previews: some View {
//        threePosterRow()
//    }
//}

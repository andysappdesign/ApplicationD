//
//  threePosterRow.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 14/07/2021.
//

import SwiftUI

struct threePosterRow: View {
    
    
    let GUISize = GUISizes()
    var size = GUISizes.Sizes.small
    
    // Three Objects
    
    init(object1: Int, object2: Int, object3: Int, MoviesWatchList: MovieWatchList) {
        self.object1 = MoviesWatchList.objectArray[object1]
        self.object2 = MoviesWatchList.objectArray[object2]
        self.object3 = MoviesWatchList.objectArray[object3]
    }
    
    // Two Objects
    
    init(object1: Int, object2: Int, MoviesWatchList: MovieWatchList) {
        self.object1 = MoviesWatchList.objectArray[object1]
        self.object2 = MoviesWatchList.objectArray[object2]
        self.object3 = JSONObject()
    }
    
    // One Object
    init(object1: Int, MoviesWatchList: MovieWatchList) {
        self.object1 = MoviesWatchList.objectArray[object1]
        self.object2 = JSONObject()
        self.object3 = JSONObject()
    }
    
    init(testing: Bool) {
            self.object1 = JSONObject(id: 1, video: true, original_language: "", overview: "", backdrop_path: "", adult: false, vote_count: 1, vote_average: 1, orginal_title: "", release_date: "", popularity: 0.00, title: "Monsters at Work", poster_path: "2gxgwhcuSmI5xtexb0t9zGj43FS.jpg", genre_ids: [])
            self.object2 = JSONObject(id: 1, video: true, original_language: "", overview: "", backdrop_path: "", adult: false, vote_count: 1, vote_average: 1, orginal_title: "", release_date: "", popularity: 0.00, title: "WandaVision", poster_path: "glKDfE6btIRcVB5zrjspRIs4r52.jpg", genre_ids: [])
            self.object3 = JSONObject()
    }
    
    let object1: JSONObject
    let object2: JSONObject
    let object3: JSONObject
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                MoviePoster(size: self.size, urlString: object1.poster_path)
            }
            Spacer()
            VStack {
                if object2.title != "" {
                    MoviePoster(size: self.size, urlString: object2.poster_path)
                }
                else {
                    blankMoviePosition(size: self.size)
                }
                
            }
            Spacer()
            VStack {
                if object3.title != "" {
                    MoviePoster(size: self.size, urlString: object3.poster_path)
                }
                else {
                    blankMoviePosition(size: self.size)
                }
            }
            Spacer()
        } // end of HStack
        .frame(width: GUISize.rowWidth, height: GUISize.smallPosterHeight + 10)
        .background(Color(ContentView.colourString))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct threePosterRow_Previews: PreviewProvider {
    static var previews: some View {
        threePosterRow(testing: true)
    }
}

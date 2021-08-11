//
//  CollectionThreePosterRow.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/08/2021.
//

import SwiftUI

struct CollectionThreePosterRow: View {
    
    let GUISize = GUISizes()
    var size = GUISizes.Sizes.small
    
    let object1: JSONMovieObject
    let object2: JSONMovieObject
    let object3: JSONMovieObject
    
    init(object1: Int, object2: Int, object3: Int, collectionController: CollectionsController) {
        self.object1 = collectionController.objectArray[object1]
        self.object2 = collectionController.objectArray[object2]
        self.object3 = collectionController.objectArray[object3]
    }
    
    // Two Objects
    
    init(object1: Int, object2: Int, collectionController: CollectionsController) {
        self.object1 = collectionController.objectArray[object1]
        self.object2 = collectionController.objectArray[object2]
        self.object3 = JSONMovieObject()
    }
    
    // One Object
    init(object1: Int, collectionController: CollectionsController) {
        self.object1 = collectionController.objectArray[object1]
        self.object2 = JSONMovieObject()
        self.object3 = JSONMovieObject()
    }
    
    init(testing: Bool) {
        self.object1 = JSONMovieObject(id: 1, video: true, original_language: "", overview: "", backdrop_path: "", adult: false, vote_count: 1, vote_average: 1, orginal_title: "", release_date: "", popularity: 0.00, title: "Monsters at Work", poster_path: "2gxgwhcuSmI5xtexb0t9zGj43FS.jpg", genre_ids: [])
        self.object2 = JSONMovieObject(id: 1, video: true, original_language: "", overview: "", backdrop_path: "", adult: false, vote_count: 1, vote_average: 1, orginal_title: "", release_date: "", popularity: 0.00, title: "WandaVision", poster_path: "glKDfE6btIRcVB5zrjspRIs4r52.jpg", genre_ids: [])
        self.object3 = self.object2
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                NavigationLink(destination: IndervidualInformation(object: object1)
                ) {
                    MoviePoster(size: self.size, urlString: object1.poster_path)
                        .overlay( WatchedMark(watched: object1.watched, type: .moviePoster))
                }
                PointsBox(text: "30 Points")
                
                
            }
            Spacer()
            VStack {
                if object2.title != "" {
                    Spacer()
                    NavigationLink(destination: IndervidualInformation(object: object2)
                    ) {
                        MoviePoster(size: self.size, urlString: object2.poster_path)
                            .overlay( WatchedMark(watched: object2.watched, type: .moviePoster))
                    }
                    PointsBox(text: "30 Points")
                    
                }
                else {
                    blankMoviePosition(size: self.size)
                }
                
            }
            Spacer()
            VStack {
                if object3.title != "" {
                    Spacer()
                    NavigationLink(destination: IndervidualInformation(object: object3)
                    ) {
                        MoviePoster(size: self.size, urlString: object3.poster_path)
                            .overlay( WatchedMark(watched: object3.watched, type: .moviePoster))
                    }
                    PointsBox(text: "30 Points")
                }
                else {
                    blankMoviePosition(size: self.size)
                }
            }
            Spacer()
        } // end of HStack
        .frame(width: GUISize.rowWidth, height: GUISize.smallPosterHeight + 60)
        .background(Color(ContentView.colourString))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CollectionThreePosterRow_Previews: PreviewProvider {
    static var previews: some View {
        CollectionThreePosterRow(testing: true)
    }
}

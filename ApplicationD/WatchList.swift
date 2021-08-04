//
//  WatchList.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 14/07/2021.
//

import SwiftUI
import CoreData

struct WatchList: View {
    
    let GUISize = GUISizes()
    let moc: NSManagedObjectContext
    @ObservedObject var Movie: MovieWatchList
    // let TV = TVWatchList()
    
    init(Movie: MovieWatchList, moc: NSManagedObjectContext) {
        self.moc = moc
        self.Movie = Movie
        if (UserDefaults.standard.string(forKey: "listsCreated") != nil) == false {
            Movie.createList(name: "Disney+ Movie Watchlist", description: "A watch list for Disney+", listId: "watch") { (responceA) in
                if responceA == true {
                    Movie.createList(name: "Disney+ Watched List", description: "The completed items in Disney+", listId: "watched") { (responceB) in
                        if responceB == true {
                            Movie.createList(name: "Suggested List", description: "A list created by friends for Disney+", listId: "sugguested")  { (responceC) in
                                if responceC == true {
                                    print("Creating lists sucessful")
                                    UserDefaults.standard.setValue(true, forKey: "listsCreated")
                                } else {
                                    print("Creating Suggested failed")
                                }
                            }
                        } else {
                            print("Creating Watched List failed")
                        }
                    }
                } else {
                    print("Creating Watch List failed")
                }
            }
        }
    }
    
    init(testing: Bool, moc: NSManagedObjectContext) {
        self.moc = moc
        self.Movie = MovieWatchList(moc: self.moc)
        Movie.objectArray = [
                JSONMovieObject(id: 1, video: true, original_language: "", overview: "", backdrop_path: "", adult: false, vote_count: 1, vote_average: 1, orginal_title: "", release_date: "", popularity: 0.00, title: "Monsters at Work", poster_path: "2gxgwhcuSmI5xtexb0t9zGj43FS.jpg", genre_ids: []),
                JSONMovieObject(id: 1, video: true, original_language: "", overview: "", backdrop_path: "", adult: false, vote_count: 1, vote_average: 1, orginal_title: "", release_date: "", popularity: 0.00, title: "WandaVision", poster_path: "glKDfE6btIRcVB5zrjspRIs4r52.jpg", genre_ids: []),
                JSONMovieObject(id: 1, video: true, original_language: "", overview: "", backdrop_path: "", adult: false, vote_count: 1, vote_average: 1, orginal_title: "", release_date: "", popularity: 0.00, title: "Monsters at Work", poster_path: "2gxgwhcuSmI5xtexb0t9zGj43FS.jpg", genre_ids: []),
                JSONMovieObject(id: 1, video: true, original_language: "", overview: "", backdrop_path: "", adult: false, vote_count: 1, vote_average: 1, orginal_title: "", release_date: "", popularity: 0.00, title: "WandaVision", poster_path: "glKDfE6btIRcVB5zrjspRIs4r52.jpg", genre_ids: []),
                JSONMovieObject(id: 1, video: true, original_language: "", overview: "", backdrop_path: "", adult: false, vote_count: 1, vote_average: 1, orginal_title: "", release_date: "", popularity: 0.00, title: "Monsters at Work", poster_path: "2gxgwhcuSmI5xtexb0t9zGj43FS.jpg", genre_ids: []),
                JSONMovieObject(id: 1, video: true, original_language: "", overview: "", backdrop_path: "", adult: false, vote_count: 1, vote_average: 1, orginal_title: "", release_date: "", popularity: 0.00, title: "WandaVision", poster_path: "glKDfE6btIRcVB5zrjspRIs4r52.jpg", genre_ids: [])]
        Movie.calculateRowAmountandObjectPositions(arrayCount: Movie.objectArray.count)
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

//
//  AddRemoveFromWatchedList.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 26/08/2021.
//

import SwiftUI

struct AddRemoveFromWatchedList: View {
    
    let controller: StateChangeController
    let movieId: Int
    
    init(movieId: Int, controller: StateChangeController) {
        self.movieId = movieId
        self.controller = controller
    }
    
    var body: some View {
        VStack {
            Button(action: {
                controller.changeFilmStatus(previousState: .exisitingWatch, newState: .markAsWatched, movieId: self.movieId, previousList: .watch) { _ in
                    
                }
            }) {
                CustomButtonLayout(size: .large, text: "Mark as Watch")
            }
            Spacer()
                .frame(height: GUISize.screenHeight / 20)
            Button(action: {
                controller.changeFilmStatus(previousState: .exisitingWatch, newState: .removeExisting, movieId: self.movieId, previousList: .watched) { _ in

                }
            }) {
                CustomButtonLayout(size: .large, text: "Remove from Watched")
            }
        }
    }
}

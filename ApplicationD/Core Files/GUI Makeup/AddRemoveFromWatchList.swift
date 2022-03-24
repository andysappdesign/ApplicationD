//
//  AddRemoveFromWatchList.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 26/08/2021.
//

import SwiftUI

struct AddRemoveFromWatchList: View {
    
    let controller: StateChangeController
    let movieId: Int
    
    init(movieId: Int, controller: StateChangeController) {
        self.movieId = movieId
        self.controller = controller
    }
    
    var body: some View {
        VStack {
            Button(action: {
                controller.changeFilmStatus(previousState: .new, newState: .addNew, movieId: self.movieId, previousList: .watch) { _ in
                    
                }
            }) {
                CustomButtonLayout(size: .large, text: "Add to Watch List")
            }
            Spacer()
                .frame(height: GUISize.screenHeight / 20)
            Button(action: {
                controller.changeFilmStatus(previousState: .new, newState: .addNew, movieId: self.movieId, previousList: .watch, completionHandler: { _ in
                    
                })
            }) {
                CustomButtonLayout(size: .large, text: "Remove from Watch List")
            }
        }
    }
}


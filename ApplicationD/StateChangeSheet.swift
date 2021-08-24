//
//  StateChangeSheet.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 05/08/2021.
//
//  This creates a sheet that can change the state of a Movie object, this works with the Indervidual Information Controller

import SwiftUI

struct StateChangeSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let controller: StateChangeController
    let movieId: Int
    
    init(movieId: Int, controller: StateChangeController) {
        self.movieId = movieId
        self.controller = controller
    }
    
    var body: some View {
        ZStack {
            Color("#ECF39E")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Change State")
                    .font(GUISize.dynamicTitleFont)
                    .fontWeight(GUISize.titleWeight)
                    .shadow(color: GUISize.titleShadowColor, radius: GUISize.titleShadowRadius, x: GUISize.titleShadowX, y: GUISize.titleShadowY)
                Spacer()
                Button(action: {
                    controller.changeFilmStatus(previousState: .new, newState: .addNew, movieId: self.movieId) { _ in
                        
                    }
                }) {
                    Text("Add to Watch List")
                        .font(GUISize.dynamicBodyBiggerFont)
                }
                Spacer()
                Button(action: {
                    controller.changeFilmStatus(previousState: .exisitingWatch, newState: .markAsWatched, movieId: self.movieId) { _ in
                        
                    }
                }) {
                    Text("Mark as Watched")
                        .font(GUISize.dynamicBodyBiggerFont)
                }
                Spacer()
                Button(action: {
                    controller.changeFilmStatus(previousState: .exisitingWatch, newState: .removeExisting, movieId: self.movieId) { _ in
                        
                    }
                }) {
                    Text("Remove From Watch List")
                        .font(GUISize.dynamicBodyBiggerFont)
                }
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Dismiss")
                }
            }
        }
        
    }
}

struct StateChangeSheet_Previews: PreviewProvider {
    static var previews: some View {
        StateChangeSheet(movieId: 17979, controller: StateChangeController())
    }
}

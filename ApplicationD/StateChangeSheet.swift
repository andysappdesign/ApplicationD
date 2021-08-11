//
//  StateChangeSheet.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 05/08/2021.
//

import SwiftUI

struct StateChangeSheet: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    let controller: IndervidualInformationController
    let movieId: Int
    
    init(movieId: Int, controller: IndervidualInformationController) {
        self.movieId = movieId
        self.controller = controller
    }
    
    var body: some View {
        ZStack {
            Color("#ECF39E")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Change State")
                    .font(.title)
                Spacer()
                Button(action: {
                    controller.changeFilmStatus(previousState: .new, newState: .addNew, movieId: self.movieId) { _ in
                        
                    }
                }) {
                    Text("Add to Watch List")
                }
                Spacer()
                Button(action: {
                    controller.changeFilmStatus(previousState: .exisitingWatch, newState: .markAsWatched, movieId: self.movieId) { _ in
                        
                    }
                }) {
                    Text("Mark as Watched")
                }
                Spacer()
                Button(action: {
                    controller.changeFilmStatus(previousState: .exisitingWatch, newState: .removeExisting, movieId: self.movieId) { _ in
                        
                    }
                }) {
                    Text("Remove From Watch List")
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
        StateChangeSheet(movieId: 17979, controller: IndervidualInformationController())
    }
}

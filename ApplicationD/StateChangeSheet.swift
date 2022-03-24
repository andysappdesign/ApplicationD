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
                AddRemoveFromWatchList(movieId: self.movieId, controller: self.controller)
                Spacer()
                    .frame(height: GUISize.screenHeight / 10)
                AddRemoveFromWatchedList(movieId: self.movieId, controller: self.controller)
                Spacer()
                    .frame(height: GUISize.screenHeight / 10)
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    CustomButtonLayout(size: .medium, text: "Done")
                }
                Spacer()
                    .frame(height: GUISize.screenHeight / 10)
            }
        }
        
    }
}

struct StateChangeSheet_Previews: PreviewProvider {
    static var previews: some View {
        StateChangeSheet(movieId: 17979, controller: StateChangeController())
    }
}

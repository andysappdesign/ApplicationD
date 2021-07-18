//
//  blankMoviePosition.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 17/07/2021.
//

import SwiftUI



struct blankMoviePosition: View {
    
    let GUISize = GUISizes()
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color(#colorLiteral(red: 0.9254901961, green: 0.9529411765, blue: 0.6196078431, alpha: 1)))
            .frame(width: GUISize.mediumPosterWidth, height: GUISize.mediumPosterHeight)
        
        
    }
}

struct blankMoviePosition_Previews: PreviewProvider {
    static var previews: some View {
        blankMoviePosition()
    }
}

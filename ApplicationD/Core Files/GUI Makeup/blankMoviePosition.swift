//
//  BlankMoviePosition.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 17/07/2021.
//
//  This sub-View creates a Blank Movie Position

import SwiftUI

struct BlankMoviePosition: View {
    
    
    var width: CGFloat
    var height: CGFloat
    
    init(size: GUISizes.Sizes) {
        switch size {
        case .extraSmall:
            width = GUISize.extraSmallPosterWidth
            height = GUISize.extraSmallPosterHeight
        case .small:
            width = GUISize.smallPosterWidth
            height = GUISize.smallPosterHeight
        case .medium:
            width = GUISize.mediumPosterWidth
            height = GUISize.mediumPosterHeight
        case .large:
            width = GUISize.largePosterWidth
            height = GUISize.largePosterHeight
        case .extraLarge:
            width = GUISize.extraLargePosterWidth
            height = GUISize.extraLargePosterHeight
        }
    }
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color(#colorLiteral(red: 0.9254901961, green: 0.9529411765, blue: 0.6196078431, alpha: 1)))
            .frame(width: self.width, height: self.height)
        
        
    }
}

struct BlankMoviePosition_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BlankMoviePosition(size: .small)
            BlankMoviePosition(size: .medium)
            BlankMoviePosition(size: .large)
            BlankMoviePosition(size: .extraLarge)
        }
    }
}

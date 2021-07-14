//
//  MoviePoster.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 14/07/2021.
//

import SwiftUI

struct MoviePoster: View {
    
    let GUISize = GUISizes()
    
    enum Sizes {
        case small
        case medium
        case large
        case extraLarge
    }
    
    var imageString: String
    var posterSize: Sizes
    var rawPoster: String = ""
    var width: CGFloat = 0
    var height: CGFloat = 0
    var aspectRatio: CGSize = CGSize(width: 11, height: 17)
    
    init(size: Sizes, imageString: String) {
        self.posterSize = size
        self.imageString = imageString
        
        switch posterSize {
        case .small:
            rawPoster = "S"
            width = GUISize.smallPosterWidth
            height = GUISize.smallPosterHeight
            aspectRatio = GUISize.smallPosterAspectRatio
        case .medium:
            rawPoster = "M"
            width = GUISize.mediumPosterWidth
            height = GUISize.mediumPosterHeight
            aspectRatio = GUISize.mediumPosterAspectRatio
        case .large:
            rawPoster = "L"
            width = GUISize.largePosterWidth
            height = GUISize.largePosterHeight
            aspectRatio = GUISize.largePosterAspectRatio
        case .extraLarge:
            rawPoster = "XL"
            width = GUISize.extraLargePosterWidth
            height = GUISize.extraLargePosterHeight
            aspectRatio = GUISize.extraLargePosterAspectRatio
        }

    }
    
    
    var body: some View {
        VStack {
            Text(rawPoster)
            Spacer()
            ZStack {
                Image(self.imageString)
                    .resizable()
                    .aspectRatio(self.aspectRatio, contentMode: .fit)
                    .frame(width: self.width, height: self.height)
                    .border(Color("#132A13"), width: 0.3)
                    .shadow(color: .gray, radius: 12, x: 0, y: 2)
                    
            }
            Spacer ()
        }
    } // end of body


}

struct MoviePoster_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MoviePoster(size: .small, imageString: "piratesMoviePoster")
                .previewDevice("iPod touch (7th generation)")
            MoviePoster(size: .medium, imageString: "piratesMoviePoster")
                .previewDevice("iPod touch (7th generation)")
            MoviePoster(size: .large, imageString: "piratesMoviePoster")
                .previewDevice("iPod touch (7th generation)")
            MoviePoster(size: .extraLarge, imageString: "piratesMoviePoster")
                .previewDevice("iPod touch (7th generation)")
        }
    }
}

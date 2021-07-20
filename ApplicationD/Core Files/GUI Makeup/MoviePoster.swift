//
//  MoviePoster.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 14/07/2021.
//

import SwiftUI

struct MoviePoster: View {
    
    let GUISize = GUISizes()
  
    var urlString: String
    var posterSize: GUISizes.Sizes
    var rawPoster: String = ""
    var width: CGFloat = 0
    var height: CGFloat = 0
    var aspectRatio: CGSize = CGSize(width: 11, height: 17)
    
  
    
    init(size: GUISizes.Sizes, urlString: String) {
        self.posterSize = size
        self.urlString = GUISize.urlFirstHalf + urlString
        
        switch posterSize {
        case .extraSmall:
            rawPoster = "XS"
            width = GUISize.extraSmallPosterWidth
            height = GUISize.extraSmallPosterHeight
            aspectRatio = GUISize.extraSmallPosterAspectRatio
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
//            Text(rawPoster)
            ZStack {
                AsyncImage(url: URL(string: self.urlString)!,
                           placeholder: { Text("Loading...") },
                           image: {Image(uiImage: $0).resizable()}
                    )
                    .frame(width: self.width, height: self.height)
                    .aspectRatio(self.aspectRatio, contentMode: .fill)
                    .border(Color("#132A13"), width: 0.3)
                    .shadow(color: .gray, radius: 12, x: 0, y: 2)
                    
            }
        }
    } // end of body


}

struct MoviePoster_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MoviePoster(size: .extraSmall, urlString: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/z8onk7LV9Mmw6zKz4hT6pzzvmvl.jpg")
                .previewDevice("iPod touch (7th generation)")
            MoviePoster(size: .small, urlString: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/z8onk7LV9Mmw6zKz4hT6pzzvmvl.jpg")
                .previewDevice("iPod touch (7th generation)")
            MoviePoster(size: .medium, urlString: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/z8onk7LV9Mmw6zKz4hT6pzzvmvl.jpg")
                .previewDevice("iPod touch (7th generation)")
            MoviePoster(size: .large, urlString: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/z8onk7LV9Mmw6zKz4hT6pzzvmvl.jpg")
                .previewDevice("iPod touch (7th generation)")
            MoviePoster(size: .extraLarge, urlString: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/z8onk7LV9Mmw6zKz4hT6pzzvmvl.jpg")
                .previewDevice("iPod touch (7th generation)")
        }
    }
}

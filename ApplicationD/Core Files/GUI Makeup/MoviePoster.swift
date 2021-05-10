//
//  MoviePoster.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/05/2021.
//

import SwiftUI

struct MoviePoster: View {
    
    let size: String
    
    
    // var imageURL: String
    
    
    var body: some View {
        VStack {
            if self.size == "S" || self.size == "s" {
                Image("piratesMoviePoster")
                    .resizable()
                    .aspectRatio(CGSize(width: 11, height: 17), contentMode: .fit)
            }
            if self.size == "M" || self.size == "m" {
                Image("piratesMoviePoster")
                    .resizable()
                    .aspectRatio(CGSize(width: 3, height: 4), contentMode: .fit)
            }
            if self.size == "L" || self.size == "l"{
                Image("piratesMoviePoster")
                    .resizable()
                    .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
            }
            if self.size == "XL" || self.size == "xl" {
                Image("piratesMoviePoster")
                    .resizable()
                    .aspectRatio(CGSize(width: 27, height: 40), contentMode: .fit)
            }
        }
    }
}

struct MoviePoster_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            MoviePoster(size: "s")
                .previewDevice("iPod touch (7th generation)")
            MoviePoster(size: "m")
                .previewDevice("iPod touch (7th generation)")
            MoviePoster(size: "l")
                .previewDevice("iPod touch (7th generation)")
            MoviePoster(size: "xl")
                .previewDevice("iPod touch (7th generation)")
            
        }

    }
}

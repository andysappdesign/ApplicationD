//
//  MyWallReview.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 18/08/2021.
//
//  This sub-View creates Review Objects for My Wall

import SwiftUI

struct MyWallReview: View {
       
    let reviewTitle: String
    let reviewRating: Double
    let reviewBody: String
    let userImage: String
    
    var body: some View {
        HStack(alignment: .top) {
            MyWallPP(imageString: self.userImage)
                .padding(2.0)
                .frame(width: GUISize.myWall_profilePictureWidthHeight)
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(GUISize.myWall_BoxColor)
                    .frame(width: GUISize.myWall_StatusBoxWidth, height: GUISize.myWall_reviewBoxHeight)
                    .overlay(
                        Text(self.reviewBody)
                            .font(.caption)
                            .padding(.top, GUISize.myWall_commentBoxHeight)
                            .frame(width: GUISize.myWall_watchingBoxWidth - 5)
                    )
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color("#132A13"))
                    .frame(width: GUISize.myWall_watchingBoxWidth, height: GUISize.myWall_commentBoxHeight)
                    .opacity(0.4)
                    .overlay(
                        VStack {
                            Text(self.reviewTitle)
                            RatingSymbolLine(count: self.reviewRating)
                        }
                    
                    )
                    
            }
            .padding(.leading, -5.0)
                
        }
        .frame(width: GUISize.myWall_rowWidth)
    }
}

struct MyWallReview_Previews: PreviewProvider {
    static var previews: some View {
        
        let body = "Jungle Cruise stars the Rock, Emily Blunt and Jack Whitehall. Emily Blunt gave a belivable performance she is not just Mary Poppins (from Mary Poppins Returns), but she gave a hint of her original character by bring her witty attiude and old school English accent. \n\nThe Rock, aka, Maui from 2016's Moana, completly was not Maui, but did replicate his character from Jumangi. However the film's acticting was really won by Jack Whitehall who was brilliantly funny in his real debut in Disney."
        
        
        MyWallReview(reviewTitle: "Review on Jungle Cruise", reviewRating: 4.5, reviewBody: body, userImage: "BeakerPP")
    }
}

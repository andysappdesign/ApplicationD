//
//  RatingsBox.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 25/07/2021.
//

import SwiftUI

struct RatingsBox: View {
    
    let GUISize: GUISizes
    
    var firstFriendName: String
    var firstFriendRating: Double
    var secondFriendName: String
    var secondFriendRating: Double
    
    init(firstFriendName: String, firstFriendRating: Double, secondFriendName: String, secondFriendRating: Double) {
        self.firstFriendName = firstFriendName
        self.firstFriendRating = firstFriendRating
        self.secondFriendName = secondFriendName
        self.secondFriendRating = secondFriendRating
        self.GUISize = GUISizes()
    }
    
    var body: some View {
        Rectangle()
            .stroke()
            .shadow(radius: 3)
            .clipShape(Rectangle())
            .foregroundColor(.white)
            .background(Color.white)
            .border(GUISize.titleShadowColor, width: 0.3)
            .overlay(VStack {
                Spacer()
                Group {
                    Text("\(self.firstFriendName) gave:")
                        .font(.caption)
                    RatingSymbolLine(count: self.firstFriendRating)
                }
                Group {
                    Text("\(self.secondFriendName) gave:")
                        .font(.caption)
                    RatingSymbolLine(count: self.secondFriendRating)
                }
                Spacer()
            })
            .frame(width: GUISize.indervidualInformation_RatingsBoxWidth, height: GUISize.indervidualInformation_RatingsBoxHeight)
        
    }
}

struct RatingsBox_Previews: PreviewProvider {
    static var previews: some View {
        let genrator = FriendsAndPointsGenerator()
        let name = genrator.generateFriends(howMany: 2)
        let score = genrator.generateReviewScore()
        RatingsBox(firstFriendName: name[0], firstFriendRating: score[0], secondFriendName: name[1], secondFriendRating: score[1])
    }
}

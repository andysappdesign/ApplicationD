//
//  RatingsBox.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 25/07/2021.
//

import SwiftUI

struct RatingsBox: View {

    let GUISize = GUISizes()
    let boxHeight: CGFloat
    let boxWidth: CGFloat
    
    var firstFriendName: String
    var firstFriendRating: Double
    var secondFriendName: String
    var secondFriendRating: Double
    
    init(firstFriendName: String, firstFriendRating: Double, secondFriendName: String, secondFriendRating: Double, boxHeight: CGFloat, boxWidth: CGFloat) {
        self.firstFriendName = firstFriendName
        self.firstFriendRating = firstFriendRating
        self.secondFriendName = secondFriendName
        self.secondFriendRating = secondFriendRating
        self.boxWidth = boxWidth
        self.boxHeight = boxHeight
    }
    
    init(testing: Bool) {
        self.firstFriendName = "Robin"
        self.firstFriendRating = 5.0
        self.secondFriendName = "Beaker"
        self.secondFriendRating = 4.5
        self.boxHeight = GUISize.indervidualInformationRatingsBoxHeight
        self.boxWidth = GUISize.indervidualInformationRatingsBoxWidth
    }
    
    init(testing: Bool, boxWidth: CGFloat, boxHeight: CGFloat) {
        self.firstFriendName = "Robin"
        self.firstFriendRating = 5.0
        self.secondFriendName = "Beaker"
        self.secondFriendRating = 4.5
        self.boxHeight = boxHeight
        self.boxWidth = boxWidth
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .stroke()
                .shadow(radius: 3)
                .clipShape(Rectangle())
                .foregroundColor(.white)
                .background(Color.white)
                .frame(width: self.boxWidth)
                .border(GUISize.titleShadowColor, width: 0.3)
            VStack {
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
            } .frame(width: self.boxWidth - 10)
            
        } .frame(width: self.boxWidth, height: self.boxHeight)
    }
}

struct RatingsBox_Previews: PreviewProvider {
    static var previews: some View {
        RatingsBox(testing: true)
    }
}

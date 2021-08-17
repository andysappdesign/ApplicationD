//
//  PointsProfileBox.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 15/08/2021.
//

import SwiftUI

struct PointsProfileBox: View {
    
    var GUISize = GUISizes()
    
    let boxWidth: CGFloat
    let boxHeight: CGFloat
    let total: Int
    
    init(boxWidth: CGFloat, boxHeight: CGFloat, totalPoints: Int) {
        self.boxWidth = boxWidth
        self.boxHeight = boxHeight
        self.total = totalPoints
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke()
                .shadow(radius: 3)
                .clipShape(Rectangle())
                .foregroundColor(.white)
                .background(Color("#90a955"))
                .border(GUISize.titleShadowColor, width: 1)
              
            ScrollView {
                VStack {
                    HStack {
                        Text("Points")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Total = \(self.total)")
                            .font(.footnote)
                        Spacer()
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text("Leaderboard Ranking")
                            .font(.caption)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        PointsBoxSmallFriends(boxHeight: GUISize.pointsBoxSmallHeight, boxWidth: GUISize.pointsBoxSmallWidth, friendOneName: "Robin", friendTwoName: "Beaker", friendThreeName: "Flynn")
                        
                        PointsBoxSmallRecent(boxWidth: GUISize.pointsBoxSmallWidth, boxHeight: GUISize.pointsBoxSmallHeight)
                    }
                    .padding([.leading, .bottom, .trailing], 7.0)
                }
                    
                    
                    
            }
            .padding(.all, 3.0)
            
        }
        .frame(width: self.boxWidth, height: self.boxHeight)
    }
}

struct PointsProfileBox_Previews: PreviewProvider {
    static var previews: some View {
        
        let GUISize = GUISizes()
        
        PointsProfileBox(boxWidth: GUISize.myProfile_pointsBoxWidth, boxHeight: GUISize.myProfile_pointsBoxHeight, totalPoints: 300)
    }
}

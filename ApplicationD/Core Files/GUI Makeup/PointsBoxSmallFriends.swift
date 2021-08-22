//
//  PointsBoxSmallFriends.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 15/08/2021.
//

import SwiftUI

struct PointsBoxSmallFriends: View {
    
    
    let boxHeight: CGFloat
    let boxWidth: CGFloat
    let friendOneName: String
    let friendTwoName: String
    let friendThreeName: String
    
    init(boxHeight: CGFloat, boxWidth: CGFloat, friendOneName: String,  friendTwoName: String, friendThreeName: String) {
        self.boxHeight = boxHeight
        self.boxWidth = boxWidth
        self.friendOneName = friendOneName
        self.friendTwoName = friendTwoName
        self.friendThreeName = friendThreeName
    }
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke()
                .shadow(radius: 3)
                .clipShape(Rectangle())
                .background(Color("#ECF39E"))
                .opacity(0.63)
                .border(GUISize.titleShadowColor, width: 0.3)
            VStack {
                Text("Friends with:")
                    .font(.footnote)
                    .padding(.top, 3.0)
                Spacer()
                VStack(alignment: .leading) {
                    Text(self.friendOneName)
                    Text(self.friendTwoName)
                    Text(self.friendThreeName)
                }
                .font(.caption2)
                Spacer()
                
                
            }
            .padding(.all, 3.0)
        }
        .frame(width: self.boxWidth, height: self.boxHeight)
    }
}

struct PointsBoxSmall_Previews: PreviewProvider {
    static var previews: some View {
        
        PointsBoxSmallFriends(boxHeight: GUISize.pointsBoxSmallHeight, boxWidth: GUISize.pointsBoxSmallWidth, friendOneName: "Robin", friendTwoName: "Beaker", friendThreeName: "Flynn")
    }
}

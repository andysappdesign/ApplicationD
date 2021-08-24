//
//  CollectionPointsBar.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/08/2021.
//
//  This sub-View creates the Points Bar on the Collections Page

import SwiftUI

struct CollectionPointsBar: View {
    
    let text: String
    let completed: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: GUISize.pointsBoxCornerRadius)
                .frame(width: GUISize.collections_PointBarWidth, height: GUISize.collections_PointBarHeight)
                .foregroundColor(GUISize.pointsBoxColor)
                .shadow(radius: GUISize.titleShadowRadius)
                .overlay(Text(self.text)
                            .font(GUISize.dynamicTitleFont)
                            .fontWeight(GUISize.titleWeight)
                            .foregroundColor(Color("#ECF39E"))
                            .shadow(color: GUISize.titleShadowColor, radius: 5, x: GUISize.titleShadowX, y: GUISize.titleShadowY)
                )
            WatchedMark(watched: self.completed, type: .pointsBar)
        }
    }
}

struct CollectionPointsBar_Previews: PreviewProvider {
    static var previews: some View {
        CollectionPointsBar(text: "300 Points", completed: false)
    }
}

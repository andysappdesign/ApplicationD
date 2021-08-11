//
//  CollectionPointsBar.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/08/2021.
//

import SwiftUI

struct CollectionPointsBar: View {
    
    let GUISize = GUISizes()
    let text: String
    let completed: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: GUISize.pointsBoxCornerRadius)
                .frame(width: GUISize.collectionsPointBarWidth, height: GUISize.collectionsPointBarHeight)
                .foregroundColor(GUISize.pointsBoxColor)
                .shadow(radius: GUISize.titleShadowRadius)
                .overlay(Text(self.text)
                            .font(GUISize.titleFont)
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

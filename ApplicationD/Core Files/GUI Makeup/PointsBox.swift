//
//  PointsBox.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/08/2021.
//

import SwiftUI

struct PointsBox: View {
    
    let GUIsize = GUISizes()
    var text: String = "30 points"
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: GUIsize.pointsBoxCornerRadius)
                .foregroundColor(GUIsize.pointsBoxColor)
                .frame(width: GUIsize.pointsBoxWidth, height: GUIsize.pointsBoxHeight)
                .overlay(Text(self.text))
                .shadow(color: Color("#132A13"), radius: 2, x: 0.0, y: 0.0)
                .frame(width: GUIsize.pointsBoxViewWidth, height: GUIsize.pointsBoxViewHeight)
        }
    }
}

struct PointsBox_Previews: PreviewProvider {
    static var previews: some View {
        PointsBox(text: "30 points")
    }
}

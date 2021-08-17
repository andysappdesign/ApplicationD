//
//  PointsBoxSmallRecent.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 15/08/2021.
//

import SwiftUI

struct PointsBoxSmallRecent: View {
    
    let GUISize = GUISizes()
    let boxHeight: CGFloat
    let boxWidth: CGFloat
    
    let recentWatchTitle: String
    let recentWatchPoints: Int
    
    init(boxWidth: CGFloat, boxHeight: CGFloat) {
        self.boxWidth = boxWidth
        self.boxHeight = boxHeight
        self.recentWatchTitle = UserDefaults.standard.string(forKey: "recentTitle") ?? "No item found"
        self.recentWatchPoints = UserDefaults.standard.integer(forKey: "recentPoints")
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
              
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Recent Watch:")
                        .font(.footnote)
                    Spacer()
                    Text(self.recentWatchTitle)
                        .font(.caption2)
                        .padding(.leading, 2.0)
                    Spacer()
                    Text("Recent Points:")
                        .font(.footnote)
                    Spacer()
                    Text(String(self.recentWatchPoints))
                        .font(.caption2)
                        .padding(.leading, 2.0)
                }
                    
            }
                .padding(.all, 3.0)
        }
        .frame(width: self.boxWidth, height: self.boxHeight)
    }
}

struct PointsBoxSmallRecent_Previews: PreviewProvider {
    static var previews: some View {
        let GUISize = GUISizes()
        PointsBoxSmallRecent(boxWidth: GUISize.pointsBoxSmallWidth, boxHeight: GUISize.pointsBoxSmallHeight)
    }
}

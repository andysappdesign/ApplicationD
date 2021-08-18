//
//  MyWall.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 17/08/2021.
//

import SwiftUI

struct MyWall: View {
    
    let GUISize = GUISizes()
    
    let status1 = "I really liked Jungle Cruise! You should see it too!"
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9254901961, green: 0.9529411765, blue: 0.6196078431, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("My Wall")
                    .font(GUISize.titleFont)
                    .fontWeight(GUISize.titleWeight)
                    .foregroundColor(GUISize.titleColor)
                    .shadow(color: GUISize.titleShadowColor, radius: GUISize.titleShadowRadius, x: GUISize.titleShadowX, y: GUISize.titleShadowY)
                Rectangle()
                    .foregroundColor(Color("#90a955"))
                    .opacity(0.4)
                    .overlay(
                        VStack {
                            MyWallStatus(status: self.status1)
                        }
                    )
                BottomBar()
            }
        }
    }
}

struct MyWall_Previews: PreviewProvider {
    static var previews: some View {
        MyWall()
    }
}

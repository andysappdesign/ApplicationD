//
//  bottomBar.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 19/07/2021.
//

import SwiftUI

struct bottomBar: View {
    
    let GUISize = GUISizes()
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: GUISize.screenWidth, height: GUISize.bottomBarHeight)
                .foregroundColor(Color("#31572c"))
            HStack {
                HStack{
                    Spacer()
                        .frame(width: GUISize.bottomBarSpacer)
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: GUISize.buttonSquareSize, height: GUISize.buttonSquareSize)
                    Spacer()
                        .frame(width: GUISize.bottomBarSpacer)
                }
                Text("|")
                    .font(GUISize.bottomBarFontSize)
                    .foregroundColor(GUISize.bottomBarFontColor)
                HStack {
                    Spacer()
                        .frame(width: GUISize.bottomBarSpacer)
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: GUISize.buttonSquareSize, height: GUISize.buttonSquareSize)
                    Spacer()
                        .frame(width: GUISize.bottomBarSpacer)
                }
                Text("|")
                    .font(GUISize.bottomBarFontSize)
                    .foregroundColor(GUISize.bottomBarFontColor)
                HStack {
                    Spacer()
                        .frame(width: GUISize.bottomBarSpacer)
                    Image(systemName: "list.star")
                        .resizable()
                        .frame(width: GUISize.buttonSquareSize, height: GUISize.buttonSquareSize)
                    Spacer()
                        .frame(width: GUISize.bottomBarSpacer)
                }
                Text("|")
                    .font(GUISize.bottomBarFontSize)
                    .foregroundColor(GUISize.bottomBarFontColor)
                HStack {
                    Spacer()
                        .frame(width: GUISize.bottomBarSpacer)
                    Image(systemName: "gamecontroller")
                        .resizable()
                        .frame(width: GUISize.buttonSquareSize, height: GUISize.buttonSquareSize)
                    Spacer()
                        .frame(width: GUISize.bottomBarSpacer)
                }
                
            } .frame(width: GUISize.screenWidth, height: GUISize.bottomBarHeight)
            .foregroundColor(Color("#ECF39E"))
                
            
        }
    }
}

struct bottomBar_Previews: PreviewProvider {
    static var previews: some View {
        bottomBar()
    }
}

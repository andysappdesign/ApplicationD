//
//  BottomBar.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 19/07/2021.
//

import SwiftUI
import CoreData

struct BottomBar: View {
    
    let GUISize = GUISizes()
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: GUISize.screenWidth, height: GUISize.BottomBarHeight)
                .foregroundColor(Color("#31572c"))
            HStack {
                HStack{
                    Spacer()
                        .frame(width: GUISize.BottomBarSpacer)
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: GUISize.buttonSquareSize, height: GUISize.buttonSquareSize)
                    }
                    Spacer()
                        .frame(width: GUISize.BottomBarSpacer)
                }
                Text("|")
                    .font(GUISize.BottomBarFontSize)
                    .foregroundColor(GUISize.BottomBarFontColor)
                HStack {
                    Spacer()
                        .frame(width: GUISize.BottomBarSpacer)
                    NavigationLink(destination: Search()) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: GUISize.buttonSquareSize, height: GUISize.buttonSquareSize)
                    }
                    Spacer()
                        .frame(width: GUISize.BottomBarSpacer)
                }
                Text("|")
                    .font(GUISize.BottomBarFontSize)
                    .foregroundColor(GUISize.BottomBarFontColor)
                HStack {
                    Spacer()
                        .frame(width: GUISize.BottomBarSpacer)
                    NavigationLink(
                        destination: ListView()
                    ) {
                        Image(systemName: "list.star")
                            .resizable()
                            .frame(width: GUISize.buttonSquareSize, height: GUISize.buttonSquareSize)
                    }
                    Spacer()
                        .frame(width: GUISize.BottomBarSpacer)
                }
                Text("|")
                    .font(GUISize.BottomBarFontSize)
                    .foregroundColor(GUISize.BottomBarFontColor)
                HStack {
                    Spacer()
                        .frame(width: GUISize.BottomBarSpacer)
                    Image(systemName: "gamecontroller")
                        .resizable()
                        .frame(width: GUISize.buttonSquareSize, height: GUISize.buttonSquareSize)
                    Spacer()
                        .frame(width: GUISize.BottomBarSpacer)
                }
                
            } .frame(width: GUISize.screenWidth, height: GUISize.BottomBarHeight)
            .foregroundColor(Color("#ECF39E"))
            
            
        }
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}

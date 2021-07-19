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
                .frame(width: GUISize.screenWidth, height: GUISize.barHeight)
                .foregroundColor(Color("#31572c"))
            HStack {
                HStack{
                    Spacer()
                        .frame(width: GUISize.barSpacer)
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: GUISize.buttonSquareSize, height: GUISize.buttonSquareSize)
                    Spacer()
                        .frame(width: GUISize.barSpacer)
                }
                Text("|")
                    .font(GUISize.fontSize)
                    .foregroundColor(GUISize.fontColor)
                HStack {
                    Spacer()
                        .frame(width: GUISize.barSpacer)
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: GUISize.buttonSquareSize, height: GUISize.buttonSquareSize)
                    Spacer()
                        .frame(width: GUISize.barSpacer)
                }
                Text("|")
                    .font(GUISize.fontSize)
                    .foregroundColor(GUISize.fontColor)
                HStack {
                    Spacer()
                        .frame(width: GUISize.barSpacer)
                    Image(systemName: "list.star")
                        .resizable()
                        .frame(width: GUISize.buttonSquareSize, height: GUISize.buttonSquareSize)
                    Spacer()
                        .frame(width: GUISize.barSpacer)
                }
                Text("|")
                    .font(GUISize.fontSize)
                    .foregroundColor(GUISize.fontColor)
                HStack {
                    Spacer()
                        .frame(width: GUISize.barSpacer)
                    Image(systemName: "gamecontroller")
                        .resizable()
                        .frame(width: GUISize.buttonSquareSize, height: GUISize.buttonSquareSize)
                    Spacer()
                        .frame(width: GUISize.barSpacer)
                }
                
            } .frame(width: GUISize.screenWidth, height: GUISize.barHeight)
            .foregroundColor(Color("#ECF39E"))
                
            
        }
    }
}

struct bottomBar_Previews: PreviewProvider {
    static var previews: some View {
        bottomBar()
    }
}

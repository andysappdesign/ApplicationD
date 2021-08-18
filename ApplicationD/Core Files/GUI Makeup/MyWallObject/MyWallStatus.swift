//
//  MyWallStatus.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 17/08/2021.
//

import SwiftUI

struct MyWallStatus: View {
    
    let GUISize = GUISizes()
    
    let status: String
    
    var body: some View {
        HStack(alignment: .top) {
            MyWallPP(imageString: "RobinPP")
                .padding(2.0)
                .frame(width: GUISize.myWall_profilePictureWidthHeight)
            RoundedRectangle(cornerRadius: 30)
                .padding(.leading, -5.0)
                .foregroundColor(GUISize.myWall_BoxColor)
                .frame(width: GUISize.myWall_StatusBoxWidth, height: GUISize.myWall_StatusBoxHeight)
                .overlay(Text(status))
                
                
        }
        .frame(width: GUISize.myWall_rowWidth)
    }
}

struct MyWallStatus_Previews: PreviewProvider {
    static var previews: some View {
        MyWallStatus(status: "Testing Status, Testing Status, Testing Status, Testing Status, Testing Status, Testing Status")
    }
}

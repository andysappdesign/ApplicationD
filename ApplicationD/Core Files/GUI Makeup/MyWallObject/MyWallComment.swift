//
//  MyWallComment.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 18/08/2021.
//

import SwiftUI

struct MyWallComment: View {
    let GUISize = GUISizes()
    
    let status: String
    let imageString: String
    
    
    var body: some View {
        HStack(alignment: .top) {
            MyWallCommentPP(imageString: imageString)
                .padding(2.0)
                .frame(width: GUISize.myWall_commentPPWidthHeight)
            RoundedRectangle(cornerRadius: 20)
                .padding(.leading, -8.0)
                .foregroundColor(GUISize.myWall_BoxColor)
                .frame(width: GUISize.myWall_commentWidth, height: GUISize.myWall_commentHeight)
                .overlay(
                    Text(status)
                        .font(.body)
                        .frame(width: GUISize.myWall_commentWidth - 10)
                )
            
            
        }
        .frame(width: GUISize.myWall_rowWidth)
    }
}

struct MyWallComment_Previews: PreviewProvider {
    static var previews: some View {
        MyWallComment(status: "Got to love Jar Jar", imageString: "NaveenPP")
    }
}

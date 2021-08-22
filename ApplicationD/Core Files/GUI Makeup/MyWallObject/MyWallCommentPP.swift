//
//  MyWallCommentPP.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 18/08/2021.
//
//  This sub-View creates Profile Pictures for Comments


import SwiftUI

struct MyWallCommentPP: View {
    
    
    let imageString: String
    
    var body: some View {
        Image(imageString)
            .resizable()
            .frame(width: GUISize.myWall_commentPPWidthHeight * 2, height: GUISize.myWall_commentPPWidthHeight, alignment: .center)
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .shadow(radius: 4)
    }
}

struct MyWallCommentPP_Previews: PreviewProvider {
    static var previews: some View {
        MyWallCommentPP(imageString: "NaveenPP")
    }
}

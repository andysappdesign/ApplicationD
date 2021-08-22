//
//  MyWallPP.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 17/08/2021.
//
//  This sub-View creates Profile Pictures for My Wall

import SwiftUI

struct MyWallPP: View {
    
//    var image: String
    var GUISize = GUISizes()
    var imageString: String
    
    var body: some View {
        Image(imageString)
            .resizable()
            .frame(width: GUISize.myWall_profilePictureWidthHeight * 2, height: GUISize.myWall_profilePictureWidthHeight, alignment: .center)
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .shadow(radius: 4)
    }}

struct MyWallPP_Previews: PreviewProvider {
    static var previews: some View {
        MyWallPP(imageString: "MantisPP")
    }
}

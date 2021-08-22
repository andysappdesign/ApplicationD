//
//  ProfilePicture.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/05/2021.
//
//  This sub-View creates a Profile Picture

import SwiftUI

struct ProfilePicture: View {
    
    //    var image: String
    var GUISize = GUISizes()
    var imageString: String
    
    var body: some View {
        Image(imageString)
            .resizable()
            .frame(width: GUISize.myProfile_profileFrame * 2, height: GUISize.myProfile_profileFrame, alignment: .center)
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .shadow(radius: 4)
    }}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture(imageString: "MantisPP")
    }
}

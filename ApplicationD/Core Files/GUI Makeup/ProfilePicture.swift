//
//  ProfilePicture.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/05/2021.
//

import SwiftUI

struct ProfilePicture: View {
    
    // This is kept commented out until a further time
    // when this view will be called with the right
    // parmaters
    
//    var image: String
    
    
    var body: some View {
        Image("jackSparrow")
            .resizable()
            .frame(width: 400, height: 200, alignment: .center)
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .shadow(radius: 4)
    }}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture()
    }
}

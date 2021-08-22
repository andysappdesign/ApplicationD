//
//  ButtonRowHome.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 13/07/2021.
//
//  This sub-View creates two Buttons in a row layout

import SwiftUI

struct ButtonRowHome: View {
    
    var body: some View {
        HStack {
            NavigationLink(destination: MyWall()) {
                CustomButtonLayout(size: .medium, text: "My Wall")
            }
            Spacer()
                .frame(width: 30)
            NavigationLink(destination: MyProfile()) {
                CustomButtonLayout(size: .medium, text: "My Profile")
            }
  
        } // end of HStack
        .frame(width: GUISize.rowWidth)
    }
}

struct Button_Row_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRowHome()
    }
}

//
//  ButtonRowProfile.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 15/08/2021.
//
//  This sub-View creates two Buttons in a row layout

import SwiftUI

struct ButtonRowProfile: View {
    
    var body: some View {
        HStack {
            NavigationLink(destination: ListView()) {
                CustomButtonLayout(size: .medium, text: "My Lists")
            }
            Spacer()
                .frame(width: 30)
            NavigationLink(destination: MyWall()) {
                CustomButtonLayout(size: .medium, text: "My Wall")
            }
            
        } // end of HStack
        .frame(width: GUISize.rowWidth)
    }
}

struct ButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRowProfile()
    }
}

//
//  ButtonRowProfile.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 15/08/2021.
//

import SwiftUI

struct ButtonRowProfile: View {
    
    let GUISize = GUISizes()
    
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

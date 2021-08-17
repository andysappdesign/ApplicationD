//
//  ButtonRow.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 15/08/2021.
//

import SwiftUI

struct ButtonRow: View {
    
    let button1Text: String
    let button2Text: String
    
    let GUISize = GUISizes()
    
    var body: some View {
        HStack {
            NavigationLink(destination: ListView()) {
                CustomButtonLayout(size: .medium, text: self.button1Text)
            }
            Spacer()
                .frame(width: 30)
            NavigationLink(destination: MyProfile()) {
                CustomButtonLayout(size: .medium, text: self.button2Text)

  
        } // end of HStack
        .frame(width: GUISize.rowWidth)
    }
}

struct ButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRow(button1Text: "button 1", button2Text: "button 2")
    }
}

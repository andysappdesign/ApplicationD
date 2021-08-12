//
//  Button Row.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 13/07/2021.
//

import SwiftUI

struct Button_Row: View {
    
    let button1Text: String
    let button2Text: String
    
    let GUISize = GUISizes()
    
    var body: some View {
        HStack {
            CustomButtonLayout(size: .medium, text: self.button1Text)
            Spacer()
                .frame(width: 30)
            NavigationLink(destination: MyProfile()) {
                CustomButtonLayout(size: .medium, text: self.button2Text)
            }
  
        } // end of HStack
        .frame(width: GUISize.rowWidth)
    }
}

struct Button_Row_Previews: PreviewProvider {
    static var previews: some View {
        Button_Row(button1Text: "button 1", button2Text: "button 2")
    }
}

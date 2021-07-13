//
//  customButtonLayout.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 13/07/2021.
//

import SwiftUI

struct customButtonLayout: View {
    
    let text: String
    let GUISize = GUISizes()
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: GUISize.twoButtonRow_ButtonWidth, height: GUISize.twoButtonRow_ButtonHeight)
                    .foregroundColor(Color("#31572c"))
                    .shadow(color: Color("#132A13"), radius: 1, x: 0, y: 2)
                    .shadow(color: Color("#132A13"), radius: 1, x: 2, y: 2)
                Text(text)
                    .font(.body)
                    .foregroundColor(Color("#ECF39E"))
                    .multilineTextAlignment(.center)
            } // end of ZStack
    }
}

struct customButton_Previews: PreviewProvider {
    static var previews: some View {
        customButtonLayout(text: "test button")
    }
}

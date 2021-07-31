//
//  CustomButtonLayout.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 13/07/2021.
//

import SwiftUI

struct CustomButtonLayout: View {
    
    let text: String
    let GUISize = GUISizes()
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    init(size: GUISizes.buttonSize, text: String){
        if size == .small {
            self.width = GUISize.indervidualInformationButtonWidth
            self.height = GUISize.indervidualInformationButtonHeight
        }
        if size == .medium {
            self.width = GUISize.twoButtonRow_ButtonWidth
            self.height = GUISize.twoButtonRow_ButtonHeight
        }
        self.text = text
    }
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: self.width, height: self.height)
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

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonLayout(size: .small, text: "test button")
    }
}

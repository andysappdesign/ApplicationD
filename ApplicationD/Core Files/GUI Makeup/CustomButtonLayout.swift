//
//  CustomButtonLayout.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 13/07/2021.
//
//  This sub-View creates a Custom Button for the app

import SwiftUI

struct CustomButtonLayout: View {
    
    let text: String
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    var inActive: Bool = false
    
    init(size: GUISizes.buttonSize, text: String){
        if size == .extraSmall {
            self.width = GUISize.indervidualInformation_ButtonWidth / 1.5
            self.height = GUISize.indervidualInformation_ButtonHeight / 1.5
        }
        if size == .small {
            self.width = GUISize.indervidualInformation_ButtonWidth
            self.height = GUISize.indervidualInformation_ButtonHeight
        }
        if size == .medium {
            self.width = GUISize.twoButtonRow_ButtonWidth
            self.height = GUISize.twoButtonRow_ButtonHeight
        }
        if size == .large {
            self.width = GUISize.twoButtonRow_LargeButtonWidth
            self.height = GUISize.twoButtonRow_LargeButtonHeight
        }
        self.text = text
    }
    
    init(size: GUISizes.buttonSize, text: String, inActive: Bool){
        if size == .small {
            self.width = GUISize.indervidualInformation_ButtonWidth
            self.height = GUISize.indervidualInformation_ButtonHeight
        }
        if size == .medium {
            self.width = GUISize.twoButtonRow_ButtonWidth
            self.height = GUISize.twoButtonRow_ButtonHeight
        }
        if size == .large {
            self.width = GUISize.twoButtonRow_LargeButtonWidth
            self.height = GUISize.twoButtonRow_LargeButtonHeight
        }
        self.inActive = inActive
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
            if self.inActive == true {
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: self.width, height: self.height)
                    .foregroundColor(Color(.gray))
                    .opacity(0.6)
            }
        } // end of ZStack
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonLayout(size: .extraSmall, text: "test button")
    }
}

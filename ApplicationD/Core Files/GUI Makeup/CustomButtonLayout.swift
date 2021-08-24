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
    var fontSize: Font = .custom("SF Font", size: 10, relativeTo: .caption)
    
    init(size: GUISizes.buttonSize, text: String){
        if size == .extraSmall {
            self.width = GUISize.indervidualInformation_ButtonWidth / 1.5
            self.height = GUISize.indervidualInformation_ButtonHeight / 1.5
            self.fontSize = .custom("SF Font", size: 8, relativeTo: .caption)
        }
        if size == .small {
            self.width = GUISize.indervidualInformation_ButtonWidth
            self.height = GUISize.indervidualInformation_ButtonHeight
            self.fontSize = .custom("SF Font", size: 12, relativeTo: .body)
        }
        if size == .medium {
            self.width = GUISize.twoButtonRow_ButtonWidth
            self.height = GUISize.twoButtonRow_ButtonHeight
            self.fontSize = .custom("SF Font", size: 16, relativeTo: .headline)
        }
        if size == .large {
            self.width = GUISize.twoButtonRow_LargeButtonWidth
            self.height = GUISize.twoButtonRow_LargeButtonHeight
            self.fontSize = .custom("SF Font", size: 16, relativeTo: .headline)
        }
        self.text = text
    }
    
    init(size: GUISizes.buttonSize, text: String, inActive: Bool){
        if size == .extraSmall {
            self.width = GUISize.indervidualInformation_ButtonWidth / 1.5
            self.height = GUISize.indervidualInformation_ButtonHeight / 1.5
            self.fontSize = .custom("SF Font", size: 8, relativeTo: .caption)
        }
        if size == .small {
            self.width = GUISize.indervidualInformation_ButtonWidth
            self.height = GUISize.indervidualInformation_ButtonHeight
            self.fontSize = .custom("SF Font", size: 12, relativeTo: .body)
        }
        if size == .medium {
            self.width = GUISize.twoButtonRow_ButtonWidth
            self.height = GUISize.twoButtonRow_ButtonHeight
            self.fontSize = .custom("SF Font", size: 12, relativeTo: .body)
        }
        if size == .large {
            self.width = GUISize.twoButtonRow_LargeButtonWidth
            self.height = GUISize.twoButtonRow_LargeButtonHeight
            self.fontSize = .custom("SF Font", size: 16, relativeTo: .headline)
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
                .font(self.fontSize)
                .foregroundColor(Color("#ECF39E"))
                .multilineTextAlignment(.center)
                .frame(width: self.width - 2, height: self.height - 2)
                .truncationMode(.tail)
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
        Group {
            CustomButtonLayout(size: .medium, text: "Pirates of the Carribbean Collection")
            CustomButtonLayout(size: .medium, text: "My Lists")
        }
    }
}

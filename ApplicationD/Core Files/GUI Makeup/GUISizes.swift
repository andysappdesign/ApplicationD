//
//  GUISizes.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 13/07/2021.
//

import Foundation
import SwiftUI

class GUISizes {
    
    // Device Information
    let screenSize: CGRect
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    
    // Row Information
    let rowWidth: CGFloat
    
    
    
    // Two Button Row Information
    let twoButtonRow_ButtonWidth: CGFloat
    let twoButtonRow_ButtonHeight: CGFloat
    
    
    
    init() {
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        rowWidth = screenWidth
        let twoButtonRow_Width = rowWidth / 2
        twoButtonRow_ButtonWidth = twoButtonRow_Width - 30
        twoButtonRow_ButtonHeight = (twoButtonRow_Width / 3) * 0.9
        
    }
    
}

//
//  GUISizes.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 13/07/2021.
//

import Foundation
import SwiftUI

class GUISizes {
    
    // URL Begining
    let urlFirstHalf = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/"
    
    // Device Information
    let screenSize: CGRect
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    // Row Information
    let rowWidth: CGFloat
    
    // Two Button Row Information
    let twoButtonRow_ButtonWidth: CGFloat
    let twoButtonRow_ButtonHeight: CGFloat
    
    //Movie Poster Sizes
    let smallPosterWidth: CGFloat
    let smallPosterHeight: CGFloat
    let mediumPosterWidth: CGFloat
    let mediumPosterHeight: CGFloat
    let largePosterWidth: CGFloat
    let largePosterHeight: CGFloat
    let extraLargePosterWidth: CGFloat
    let extraLargePosterHeight: CGFloat
    
    // Movie Poster Aspect Ratio
    
    let smallPosterAspectRatio = CGSize(width: 11, height: 17)
    let mediumPosterAspectRatio = CGSize(width: 2, height: 3)
    let largePosterAspectRatio = CGSize(width: 2, height: 3)
    let extraLargePosterAspectRatio = CGSize(width: 27, height: 40)
    
    // Bottem Bar Information
    let barHeight: CGFloat
    let barSpacer: CGFloat
    let fontSize: Font
    let fontColor: Color
    let buttonSquareSize: CGFloat // same for width and height
    
    // Sizes
    
    enum Sizes {
        case small
        case medium
        case large
        case extraLarge
    }
    
    
    
    init() {
        self.screenSize = UIScreen.main.bounds
        self.screenWidth = self.screenSize.width
        self.screenHeight = self.screenSize.height
        self.rowWidth = self.screenWidth
        let twoButtonRow_Width = self.rowWidth / 2
        
        self.twoButtonRow_ButtonWidth = twoButtonRow_Width - 30
        self.twoButtonRow_ButtonHeight = (twoButtonRow_Width / 3) * 0.9
        
        self.smallPosterWidth = twoButtonRow_Width / 2
        self.smallPosterHeight = twoButtonRow_Width * 0.75
        
        self.mediumPosterWidth = twoButtonRow_Width * 0.75
        self.mediumPosterHeight = self.smallPosterHeight * 1.5
        
        self.largePosterWidth = self.smallPosterWidth * 1.45
        self.largePosterHeight = self.smallPosterHeight * 1.45
        
        self.extraLargePosterWidth = self.mediumPosterWidth * 1.82
        self.extraLargePosterHeight = self.mediumPosterHeight * 1.8
        
        self.barHeight = twoButtonRow_ButtonHeight * 0.9
        self.barSpacer = 20.0
        self.fontSize = .title
        self.fontColor = Color("#90a955")
        self.buttonSquareSize = self.barHeight * 0.7
        
        
    }
    
}

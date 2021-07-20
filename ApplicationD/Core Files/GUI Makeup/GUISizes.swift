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
    let extraSmallPosterWidth: CGFloat
    let extraSmallPosterHeight: CGFloat
    let smallPosterWidth: CGFloat
    let smallPosterHeight: CGFloat
    let mediumPosterWidth: CGFloat
    let mediumPosterHeight: CGFloat
    let largePosterWidth: CGFloat
    let largePosterHeight: CGFloat
    let extraLargePosterWidth: CGFloat
    let extraLargePosterHeight: CGFloat
    
    // Movie Poster Aspect Ratio
    
    let extraSmallPosterAspectRatio = CGSize(width: 2, height: 3)
    let smallPosterAspectRatio = CGSize(width: 11, height: 17)
    let mediumPosterAspectRatio = CGSize(width: 2, height: 3)
    let largePosterAspectRatio = CGSize(width: 2, height: 3)
    let extraLargePosterAspectRatio = CGSize(width: 27, height: 40)
    
    // Bottem Bar Information
    let bottomBarHeight: CGFloat
    let bottomBarSpacer: CGFloat
    let bottomBarFontSize: Font
    let bottomBarFontColor: Color
    let buttonSquareSize: CGFloat // same for width and height
    
    // Sizes
    
    enum Sizes {
        case extraSmall
        case small
        case medium
        case large
        case extraLarge
    }
    
    // Page Items
    let titleFont: Font = .title
    let titleWeight: Font.Weight = .medium
    let titleColor = Color("#132A13")
    let titleShadowColor = Color("#132A13")
    let titleShadowRadius: CGFloat = 1
    let titleShadowX: CGFloat = 0
    let titleShadowY: CGFloat = 1
    let bodyFontSize: Font = .custom("SFProText", fixedSize: 18)
    
    // Indervidual Information
    let indervidualInformationOverviewBoxWidth: CGFloat
    let castBoxWidth: CGFloat
    
    // MARK:- init
    
    init() {
        self.screenSize = UIScreen.main.bounds
        self.screenWidth = self.screenSize.width
        self.screenHeight = self.screenSize.height
        self.rowWidth = self.screenWidth
        let twoButtonRow_Width = self.rowWidth / 2
        
        self.twoButtonRow_ButtonWidth = twoButtonRow_Width - 30
        self.twoButtonRow_ButtonHeight = (twoButtonRow_Width / 3) * 0.9
        
        self.extraSmallPosterWidth = twoButtonRow_Width / 3
        self.extraSmallPosterHeight = twoButtonRow_Width / 2
        
        self.smallPosterWidth = twoButtonRow_Width / 2
        self.smallPosterHeight = twoButtonRow_Width * 0.75
        
        self.mediumPosterWidth = twoButtonRow_Width * 0.75
        self.mediumPosterHeight = self.smallPosterHeight * 1.5
        
        self.largePosterWidth = self.smallPosterWidth * 1.45
        self.largePosterHeight = self.smallPosterHeight * 1.45
        
        self.extraLargePosterWidth = self.mediumPosterWidth * 1.82
        self.extraLargePosterHeight = self.mediumPosterHeight * 1.8
        
        self.bottomBarHeight = twoButtonRow_ButtonHeight * 0.9
        self.bottomBarSpacer = 20.0
        self.bottomBarFontSize = .largeTitle
        self.bottomBarFontColor = Color("#90a955")
        self.buttonSquareSize = self.bottomBarHeight * 0.7
        
        self.indervidualInformationOverviewBoxWidth = (((self.screenWidth - self.largePosterWidth) - 10) - 2)
        self.castBoxWidth = self.screenWidth + 4
        
        
    }
    
}

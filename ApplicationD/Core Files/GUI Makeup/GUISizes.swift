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
    
    // Sizes
    
    enum Sizes {
        case small
        case medium
        case large
        case extraLarge
    }
    
    
    
    init() {
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        rowWidth = screenWidth
        let twoButtonRow_Width = rowWidth / 2
        
        twoButtonRow_ButtonWidth = twoButtonRow_Width - 30
        twoButtonRow_ButtonHeight = (twoButtonRow_Width / 3) * 0.9
        
        smallPosterWidth = twoButtonRow_Width / 2
        smallPosterHeight = twoButtonRow_Width * 0.75
        
        mediumPosterWidth = twoButtonRow_Width * 0.75
        mediumPosterHeight = smallPosterHeight * 1.5
        
        largePosterWidth = smallPosterWidth * 1.45
        largePosterHeight = smallPosterHeight * 1.45
        
        extraLargePosterWidth = mediumPosterWidth * 1.82
        extraLargePosterHeight = mediumPosterHeight * 1.8
        
    }
    
}

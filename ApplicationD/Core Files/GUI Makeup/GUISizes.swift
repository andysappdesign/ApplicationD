//
//  GUISizes.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 13/07/2021.
//

import Foundation
import SwiftUI

class GUISizes {
    
    // MARK: URL Begining
    let urlFirstHalf = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/"
    
    // MARK: Device Information
    let screenSize: CGRect
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    // MARK: Row Information
    let rowWidth: CGFloat
    
    // MARK: Two Button Row Information
    let twoButtonRow_ButtonWidth: CGFloat
    let twoButtonRow_ButtonHeight: CGFloat
    let twoButtonRow_LargeButtonWidth: CGFloat
    let twoButtonRow_LargeButtonHeight: CGFloat
    
    // MARK: Movie Poster Sizes
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
    
    // MARK: Movie Poster Aspect Ratio
    
    let extraSmallPosterAspectRatio = CGSize(width: 2, height: 3)
    let smallPosterAspectRatio = CGSize(width: 11, height: 17)
    let mediumPosterAspectRatio = CGSize(width: 2, height: 3)
    let largePosterAspectRatio = CGSize(width: 2, height: 3)
    let extraLargePosterAspectRatio = CGSize(width: 27, height: 40)
    
    // MARK: Bottem Bar Information
    let BottomBarHeight: CGFloat
    let BottomBarSpacer: CGFloat
    let BottomBarFontSize: Font
    let BottomBarFontColor: Color
    let buttonSquareSize: CGFloat // same for width and height
    
    // MARK: Sizes
    
    enum Sizes {
        case extraSmall
        case small
        case medium
        case large
        case extraLarge
    }
    
    // MARK: Button Size
    
    enum buttonSize {
        case extraSmall
        case small
        case medium
        case large
    }
    
    // MARK: Page Items
    let titleFont: Font = .title
    let titleWeight: Font.Weight = .medium
    let titleColor = Color("#132A13")
    let titleShadowColor = Color("#132A13")
    let titleShadowRadius: CGFloat = 1
    let titleShadowX: CGFloat = 0
    let titleShadowY: CGFloat = 1
    let bodyFontSize: Font = .custom("SFProText", fixedSize: 18)
    
    // MARK: Indervidual Information
    let indervidualInformation_OverviewBoxWidth: CGFloat
    let indervidualInformation_RatingsBoxWidth: CGFloat
    let indervidualInformation_RatingsBoxHeight: CGFloat
    let castBoxWidth: CGFloat
    let indervidualInformation_ButtonWidth: CGFloat
    let indervidualInformation_ButtonHeight: CGFloat
    
    // MARK: Search Box
    
    let searchFormHeight: CGFloat
    
    // MARK: Points Box
    
    let pointsBoxWidth: CGFloat
    let pointsBoxHeight: CGFloat
    let pointsBoxViewWidth: CGFloat
    let pointsBoxViewHeight: CGFloat
    let pointsBoxCornerRadius: CGFloat
    let pointsBoxColor = Color("#90a955")
    let pointsBoxWidthBorder: CGFloat
    let pointsBoxHeightBorder: CGFloat
    let pointsBoxSmallWidth: CGFloat
    let pointsBoxSmallHeight: CGFloat
    
    //MARK: Watch Symbol
    
    let watchedMarkWidth: CGFloat
    let watchedMarkHeight: CGFloat
    
    // MARK: Collection Points Bar
    
    let collections_PointBarWidth: CGFloat
    let collections_PointBarHeight: CGFloat
    
    // MARK: My Profile
    
    let myProfile_profileFrame: CGFloat
    let myProfile_pointsBoxHeight: CGFloat
    let myProfile_pointsBoxWidth: CGFloat
    
    // MARK: My Wall
    
    let myWall_profilePictureWidthHeight: CGFloat
    let myWall_BoxColor = Color("#ECF39E")
    let myWall_StatusBoxWidth: CGFloat
    let myWall_StatusBoxHeight: CGFloat
    let myWall_rowWidth: CGFloat
    let myWall_watchingBoxWidth: CGFloat
    let myWall_watchingBoxHeight: CGFloat
    let myWall_commentBoxHeight: CGFloat
    let myWall_commentWidth: CGFloat
    let myWall_commentHeight: CGFloat
    let myWall_commentPPWidthHeight: CGFloat
    let myWall_reviewBoxHeight: CGFloat

    // MARK:- init
    
    init() {
        self.screenSize = UIScreen.main.bounds
        self.screenWidth = self.screenSize.width
        self.screenHeight = self.screenSize.height
        self.rowWidth = self.screenWidth - 18
        let twoButtonRow_Width = self.rowWidth / 2
        
        self.twoButtonRow_ButtonWidth = twoButtonRow_Width - 30
        self.twoButtonRow_ButtonHeight = (twoButtonRow_Width / 3) * 0.9
        self.twoButtonRow_LargeButtonWidth = self.twoButtonRow_ButtonWidth * 1.5
        self.twoButtonRow_LargeButtonHeight = self.twoButtonRow_ButtonHeight
        
        self.extraSmallPosterWidth = twoButtonRow_Width / 3
        self.extraSmallPosterHeight = twoButtonRow_Width / 2
        
        self.smallPosterWidth = twoButtonRow_Width / 2
        self.smallPosterHeight = twoButtonRow_Width * 0.75
        
        self.mediumPosterWidth = twoButtonRow_Width * 0.70
        self.mediumPosterHeight = self.smallPosterHeight * 1.35
        
        self.largePosterWidth = self.smallPosterWidth * 1.45
        self.largePosterHeight = self.smallPosterHeight * 1.45
        
        self.extraLargePosterWidth = self.mediumPosterWidth * 1.82
        self.extraLargePosterHeight = self.mediumPosterHeight * 1.8
        
        self.BottomBarHeight = twoButtonRow_ButtonHeight * 0.9
        self.BottomBarSpacer = 20.0
        self.BottomBarFontSize = .largeTitle
        self.BottomBarFontColor = Color("#90a955")
        self.buttonSquareSize = self.BottomBarHeight * 0.7
        
        self.indervidualInformation_OverviewBoxWidth = (((self.screenWidth - self.largePosterWidth) - 10) - 2)
        self.castBoxWidth = self.screenWidth + 4
        self.indervidualInformation_ButtonWidth = self.twoButtonRow_ButtonWidth * 0.9
        self.indervidualInformation_ButtonHeight = self.twoButtonRow_ButtonHeight
        self.indervidualInformation_RatingsBoxWidth = self.rowWidth / 2
        self.indervidualInformation_RatingsBoxHeight = self.screenHeight / 4
        
        self.searchFormHeight = self.screenHeight / 4
        
        self.pointsBoxWidth = self.smallPosterWidth
        self.pointsBoxHeight = self.smallPosterWidth / 2
        self.pointsBoxViewWidth = self.pointsBoxWidth + 10
        self.pointsBoxViewHeight = self.pointsBoxHeight + 10
        self.pointsBoxCornerRadius = 3
        self.pointsBoxWidthBorder = self.pointsBoxWidth + 1.3
        self.pointsBoxHeightBorder = self.pointsBoxHeight + 0.8
        self.pointsBoxSmallWidth = self.pointsBoxWidth * 1.35
        self.pointsBoxSmallHeight = self.pointsBoxHeight * 2.5
        
        self.watchedMarkWidth = 28
        self.watchedMarkHeight = self.watchedMarkWidth
        
        self.collections_PointBarWidth = self.screenWidth - 20
        self.collections_PointBarHeight = self.BottomBarHeight
        
        self.myProfile_profileFrame = screenHeight * 0.2
        self.myProfile_pointsBoxWidth = myProfile_profileFrame * 1.6
        self.myProfile_pointsBoxHeight = myProfile_profileFrame * 1.7
        
        self.myWall_profilePictureWidthHeight = 40
        self.myWall_StatusBoxWidth = self.indervidualInformation_RatingsBoxWidth * 1.4
        self.myWall_StatusBoxHeight = self.pointsBoxHeight * 2.5
        self.myWall_rowWidth = self.rowWidth * 0.9
        self.myWall_watchingBoxWidth = self.myWall_StatusBoxWidth
        self.myWall_watchingBoxHeight = self.myWall_StatusBoxHeight * 2
        self.myWall_commentBoxHeight = self.myWall_StatusBoxHeight
        self.myWall_commentWidth = (self.myWall_watchingBoxWidth / 3) * 2
        self.myWall_commentHeight = (self.myWall_commentBoxHeight / 3) * 2
        self.myWall_commentPPWidthHeight = (myWall_profilePictureWidthHeight / 3) * 2
        self.myWall_reviewBoxHeight = self.myWall_watchingBoxHeight * 2
    }
    
}

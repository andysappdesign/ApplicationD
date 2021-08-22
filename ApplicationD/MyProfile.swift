//
//  MyProfile.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 12/08/2021.
//
// This View displays the User's Profile page, where they can see information like Friends and their own points

import SwiftUI

struct MyProfile: View {
    
    var GUISize = GUISizes()
    var name = UserDefaults.standard.string(forKey: "firstName")
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9254901961, green: 0.9529411765, blue: 0.6196078431, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Text("My Profile")
                    .font(GUISize.titleFont)
                    .fontWeight(GUISize.titleWeight)
                    .multilineTextAlignment(.center)
                    .foregroundColor(GUISize.titleColor)
                    .shadow(color: GUISize.titleShadowColor, radius: GUISize.titleShadowRadius, x: GUISize.titleShadowX, y: GUISize.titleShadowY)
                    .frame(width: GUISize.screenWidth - 40)
                    .lineLimit(2)
                Spacer()
                    .frame(height: GUISize.screenHeight * 0.05)
                
                HStack(alignment: .top) {
                    Spacer()
                        .frame(width: GUISize.screenWidth * 0.1)
                    VStack {
                        ProfilePicture(imageString: "NaveenPP")
                        CustomButtonLayout(size: .extraSmall, text: "Change", inActive: true)
                    }
                    .frame(width: GUISize.screenWidth * 0.3)
                    Spacer()
                        .frame(width: GUISize.screenWidth * 0.01)
                    VStack(alignment: .leading) {
                        Text(name ?? "User")
                        Text("username")
                        Spacer()
                        
                    }.frame(width: GUISize.screenWidth * 0.5)
                    Spacer()
                        .frame(width: GUISize.screenWidth * 0.1)
                } .frame(width: GUISize.screenWidth, height: GUISize.screenHeight / 3.6)
                
                
                
                Spacer()
                PointsProfileBox(boxWidth: GUISize.myProfile_pointsBoxWidth, boxHeight: GUISize.myProfile_pointsBoxHeight, totalPoints: UserDefaults.standard.integer(forKey: "totalPoints"))
                Spacer()
                ButtonRowProfile()
                BottomBar()
            }
            .frame(height: GUISize.screenWidth)
        }
        
    }
}

struct MyProfile_Previews: PreviewProvider {
    static var previews: some View {
        MyProfile()
    }
}

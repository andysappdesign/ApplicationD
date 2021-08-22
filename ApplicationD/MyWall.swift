//
//  MyWall.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 17/08/2021.
//
//  This view displayes the faked social media type wall in the app

import SwiftUI

struct MyWall: View {
    
    let statusUserString1 = "RobinPP"
    let status1 = "I really liked Jungle Cruise! You should see it too!"
    let watching1 = "Star Wars: Episode 1 - The Phantom Menace"
    let comment1 = "Got to love Jar Jar Binks 😍"
    let commentPicString1 = "NaveenPP"
    let reviewTitle1 = "Review on Jungle Cruise"
    let reviewRating1 = 4.5
    let reviewBody1 = "Jungle Cruise stars the Rock, Emily Blunt and Jack Whitehall. Emily Blunt gave a belivable performance she is not just Mary Poppins (from Mary Poppins Returns), but she gave a hint of her original character by bring her witty attiude and old school English accent. \n\nThe Rock, aka, Maui from 2016's Moana, completly was not Maui, but did replicate his character from Jumangi. However the film's acticting was really won by Jack Whitehall who was brilliantly funny in his real debut in Disney."
    let reviewUser1 = "BeakerPP"
    let statusUserString2 = "MantisPP"
    let status2 = "Everybody should watch the Decendants! #cheeseFest #catchyTunes"
    let statusUserString3 = "BeakerPP"
    let status3 = "Excited to see Jungle Cruise"
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9254901961, green: 0.9529411765, blue: 0.6196078431, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("My Wall")
                    .font(
                        
                        GUISize.titleFont)
                    .fontWeight(GUISize.titleWeight)
                    .foregroundColor(GUISize.titleColor)
                    .shadow(color: GUISize.titleShadowColor, radius: GUISize.titleShadowRadius, x: GUISize.titleShadowX, y: GUISize.titleShadowY)
                Rectangle()
                    .foregroundColor(Color("#90a955"))
                    .opacity(0.4)
                    .overlay(
                        ScrollView {
                            Spacer()
                            MyWallStatus(status: self.status1, userImage: self.statusUserString1)
                            Spacer()
                            MyWallWatching(watching: self.watching1, comment: self.comment1, commenterImageString: self.commentPicString1, userString: "MariaPP")
                            Spacer()
                            MyWallReview(reviewTitle: self.reviewTitle1, reviewRating: self.reviewRating1, reviewBody: self.reviewBody1, userImage: self.reviewUser1)
                            Spacer()
                            MyWallStatus(status: self.status2, userImage: self.statusUserString2)
                            Spacer()
                            MyWallStatus(status: self.status3, userImage: self.statusUserString3)
                        }
                        
                    )
                BottomBar()
            }
        }
    }
}

struct MyWall_Previews: PreviewProvider {
    static var previews: some View {
        MyWall()
    }
}

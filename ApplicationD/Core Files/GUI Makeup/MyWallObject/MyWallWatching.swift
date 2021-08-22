//
//  MyWallWatching.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 18/08/2021.
//
//  This sub-View creates Watching Objects for My Wall

import SwiftUI

struct MyWallWatching: View {
    
    let userString: String
    let totalString: String
    let imageString: String
    let comment: String
    
    init(watching: String, comment: String, commenterImageString: String, userString: String) {
        let firstString = "I'm watching "
        let secondSting = watching
        self.userString = userString
        self.totalString = firstString + secondSting
        self.comment = comment
        self.imageString = commenterImageString
        
    }
    
    var body: some View {
        HStack(alignment: .top) {
            MyWallPP(imageString: self.userString)
                .padding(.leading, 90.0)
                .frame(width: GUISize.myWall_profilePictureWidthHeight)
            ZStack(alignment: .bottom){
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(GUISize.myWall_BoxColor)
                    .frame(width: GUISize.myWall_watchingBoxWidth, height: GUISize.myWall_watchingBoxHeight)
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color("#132A13"))
                    .frame(width: GUISize.myWall_watchingBoxWidth, height: GUISize.myWall_commentBoxHeight)
                    .opacity(0.4)
                Text(self.totalString)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 100)
                    .frame(width: GUISize.myWall_watchingBoxWidth, height: (GUISize.myWall_watchingBoxHeight - 3))
                MyWallComment(status: "Got to love Jar Jar Binks!", imageString: "NaveenPP")
                    .padding()
                
            }
            .padding(.leading, -5.0)
            
        }
        .frame(width: GUISize.myWall_rowWidth)
    }
}

//struct MyWallWatching_Previews: PreviewProvider {
//    static var previews: some View {
//        MyWallWatching(watching: "Star Wars: Episode I – The Phantom Menace", comment: "Got to love Jar Jar", commenterImageString: "NaveenPP")
//    }
//}

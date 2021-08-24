//
//  OverViewBox.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 19/07/2021.
//
//  This sub-View creates a Movie Poster Object for the app

import SwiftUI

struct OverViewBox: View {
    
    let boxHeight: CGFloat
    let boxWidth: CGFloat
    let overview: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .stroke()
                .shadow(radius: 3)
                .clipShape(Rectangle())
                .foregroundColor(.white)
                .background(Color.white)
                .border(GUISize.titleShadowColor, width: 0.3)
            
            ScrollView {
                Text(self.overview)
                    .font(GUISize.dynamicBodyFont)
                
            }
            .padding(.all, 3.0)
        }
        .frame(width: self.boxWidth, height: self.boxHeight)
    }
}

struct OverViewBox_Previews: PreviewProvider {
    static var previews: some View {
        
        let overview = "Jack Sparrow, a freewheeling 18th-century pirate, quarrels with a rival pirate bent on pillaging Port Royal. When the governor's daughter is kidnapped, Sparrow decides to help the girl's love save her."
        OverViewBox(boxHeight: GUISize.largePosterHeight, boxWidth: (GUISize.largePosterWidth * 2), overview: overview)
    }
}

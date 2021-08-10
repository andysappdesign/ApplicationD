//
//  WatchedMark.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/08/2021.
//

import SwiftUI

struct WatchedMark: View {
    
    let GUISize = GUISizes()
    let watched: Bool
    
    init(watched: Bool){
        self.watched = watched
    }
    
    var body: some View {
        if self.watched == true {
            Image(systemName: "checkmark.circle")
                .resizable()
                .frame(width: GUISize.watchedMarkWidth, height: GUISize.watchedMarkHeight)
                .padding(.init(top: GUISize.smallPosterHeight - 5, leading: GUISize.smallPosterWidth, bottom: 0.0, trailing: 0.0))
                .foregroundColor(.black)
                .shadow(radius: 2)
        } else {
            Image(systemName: "x.circle")
                .resizable()
                .frame(width: GUISize.watchedMarkWidth, height: GUISize.watchedMarkHeight)
                .padding(.init(top: GUISize.smallPosterHeight - 5, leading: GUISize.smallPosterWidth, bottom: 0.0, trailing: 0.0))
                .foregroundColor(.black)
                .shadow(radius: 2)
        }
        
        
    }
}

struct WatchedMark_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WatchedMark(watched: true)
            WatchedMark(watched: false)
        }
    }
}

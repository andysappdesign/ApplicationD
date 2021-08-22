//
//  WatchedMark.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/08/2021.
//

import SwiftUI

struct WatchedMark: View {
    
    
    let watched: Bool
    
    var paddingTop: CGFloat = 0.0
    var paddingLeading: CGFloat = 0.0
    var paddingBottom: CGFloat = 0.0
    var paddingTrailing: CGFloat = 0.0
    
    enum markType {
        case moviePoster
        case pointsBar
    }
    
    init(watched: Bool, type: markType){
        self.watched = watched
        if type == .moviePoster {
            self.paddingTop = GUISize.smallPosterHeight + 5
            self.paddingLeading = GUISize.smallPosterWidth
        } else {
            self.paddingLeading = GUISize.collections_PointBarWidth - 10
            self.paddingBottom = GUISize.collections_PointBarHeight - 5
        }
    }
    
    var body: some View {
        if self.watched == true {
            Image(systemName: "checkmark.circle")
                .resizable()
                .frame(width: GUISize.watchedMarkWidth, height: GUISize.watchedMarkHeight)
                .padding(.init(top: self.paddingTop, leading: self.paddingLeading, bottom: self.paddingBottom, trailing: self.paddingTrailing))
                .foregroundColor(.black)
                .shadow(color: .white, radius: 2)
        } else {
            Image(systemName: "x.circle")
                .resizable()
                .frame(width: GUISize.watchedMarkWidth, height: GUISize.watchedMarkHeight)
                .padding(.init(top: self.paddingTop, leading: self.paddingLeading, bottom: self.paddingBottom, trailing: self.paddingTrailing))
                .foregroundColor(.black)
                .shadow(color: .white, radius: 2)
        }
        
        
    }
}

struct WatchedMark_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WatchedMark(watched: true, type: .moviePoster)
            WatchedMark(watched: false, type: .pointsBar)
        }
    }
}

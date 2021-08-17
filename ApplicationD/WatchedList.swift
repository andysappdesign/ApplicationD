//
//  WatchedListView.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 11/08/2021.
//

import SwiftUI
import CoreData

struct WatchedListView: View {
    
    
    @ObservedObject var controller = WatchedListController()
    var GUISize = GUISizes()
    
    
    
    var body: some View {
        ZStack {
            Color("#ECF39E")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("My Watched List")
                    .font(GUISize.titleFont)
                    .fontWeight(GUISize.titleWeight)
                    .foregroundColor(GUISize.titleColor)
                    .shadow(color: GUISize.titleShadowColor, radius: GUISize.titleShadowRadius, x: GUISize.titleShadowX, y: GUISize.titleShadowY)
                ForEach(controller.rowObjectPositions, id: \.self) { array in
                    if array.count == 3 {
                        WatchedThreePosterRow(object1: array[0], object2: array[1], object3: array[2], WatchedListController: self.controller)
                    } else if array.count == 2 {
                        WatchedThreePosterRow(object1: array[0], object2: array[1], WatchedListController: self.controller)
                    } else if array.count == 1 {
                        WatchedThreePosterRow(object1: array[0], WatchedListController: self.controller)
                    }
                }
                Spacer()
                BottomBar()
                
            }
        }
        
    }
}

struct WatchedList_Previews: PreviewProvider {
    static var previews: some View {
        WatchedListView()
    }
}

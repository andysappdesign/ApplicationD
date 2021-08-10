//
//  CollectionView.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 08/08/2021.
//

import SwiftUI

struct CollectionView: View {
    
    let GUISize = GUISizes()
    let collectionId: Int
    let controller: CollectionsController
    let collectionName: String
    
    init(id: Int, name: String) {
        self.collectionId = id
        self.controller = CollectionsController(id: self.collectionId)
        self.collectionName = name
        controller.getMoviesInCollection {
            
        }
    }
    
    var body: some View {
        ZStack {
            Color("#ECF39E")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text(self.collectionName)
                    .font(GUISize.titleFont)
                    .fontWeight(GUISize.titleWeight)
                    .multilineTextAlignment(.center)
                    .foregroundColor(GUISize.titleColor)
                    .shadow(color: GUISize.titleShadowColor, radius: GUISize.titleShadowRadius, x: GUISize.titleShadowX, y: GUISize.titleShadowY)
                Spacer()
                ForEach(controller.rowObjectPositions, id: \.self) { array in
                    if array.count == 3 {
                        CollectionThreePosterRow(object1: array[0], object2: array[1], object3: array[2], collectionController: self.controller)
                    } else if array.count == 2 {
                        CollectionThreePosterRow(object1: array[0], object2: array[1], collectionController: self.controller)
                    } else if array.count == 1 {
                        CollectionThreePosterRow(object1: array[0], collectionController: self.controller)
                    }
                }
                Spacer()
                bottomBar()
                    
            } // end of VStack
        }// end of ZStack
        
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        let pirates = 295
        let name = "Pirates of the Carribean"
        CollectionView(id: pirates, name: name)
    }
}

//
//  CollectionView.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 08/08/2021.
//
//  This view dispays collections of films like the 'Pirates of the Carribbean Collection', this works with the Collections Controller

import SwiftUI

struct CollectionView: View {
    
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
                    .font(GUISize.dynamicTitleFont)
                    .fontWeight(GUISize.titleWeight)
                    .multilineTextAlignment(.center)
                    .foregroundColor(GUISize.titleColor)
                    .shadow(color: GUISize.titleShadowColor, radius: GUISize.titleShadowRadius, x: GUISize.titleShadowX, y: GUISize.titleShadowY)
                    .frame(width: GUISize.screenWidth - 40)
                    .lineLimit(2)
                Spacer()
                ScrollView {
                    CollectionsRows(collectionsController: self.controller)
                    
                }
                CollectionPointsBar(text: "300 Points", completed: false)
                BottomBar()
                
            } // end of VStack
        }// end of ZStack
        
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        let pirates = 295
        let name = "Pirates of the Carribean Collection"
        CollectionView(id: pirates, name: name)
            .previewDevice("iPod touch (7th generation)")
    }
}

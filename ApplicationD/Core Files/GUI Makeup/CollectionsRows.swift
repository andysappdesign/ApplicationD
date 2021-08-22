//
//  CollectionsRows.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/08/2021.
//
//  This sub-View helps form the rows of Movie Posters in the Collections View

import SwiftUI

struct CollectionsRows: View {
    
    let controller: CollectionsController
    
    init(collectionsController: CollectionsController) {
        self.controller = collectionsController
    }
    
    var body: some View {
        ForEach(controller.rowObjectPositions, id: \.self) { array in
            if array.count == 3 {
                CollectionThreePosterRow(object1: array[0], object2: array[1], object3: array[2], collectionController: self.controller)
            } else if array.count == 2 {
                CollectionThreePosterRow(object1: array[0], object2: array[1], collectionController: self.controller)
            } else if array.count == 1 {
                CollectionThreePosterRow(object1: array[0], collectionController: self.controller)
            }
        }
    }
}



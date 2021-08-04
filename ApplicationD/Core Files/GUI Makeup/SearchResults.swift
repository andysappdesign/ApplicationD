//
//  SearchResults.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 31/07/2021.
//

import SwiftUI
import CoreData

struct SearchResults: View {
    
    let moc: NSManagedObjectContext
    @ObservedObject var controller: searchController
    
    init(moc: NSManagedObjectContext, conroller: searchController) {
        self.moc = moc
        self.controller = conroller
    }
    
    var body: some View {
        VStack {
            ForEach(controller.searchRowObjectPositions, id: \.self) { array in
                if array.count == 3 {
                    SearchResultsThreePosterRow(object1: array[0], object2: array[1], object3: array[2], searchController: self.controller, moc: self.moc)
                } else if array.count == 2 {
                    SearchResultsThreePosterRow(object1: array[0], object2: array[1], searchController: self.controller, moc: self.moc)
                } else if array.count == 1 {
                    SearchResultsThreePosterRow(object1: array[0], searchController: self.controller, moc: self.moc)
                }
            }
        }
    }
}

//
//  SearchResults.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 31/07/2021.
//

import SwiftUI

struct SearchResults: View {
   
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var controller: searchController
    
    init(conroller: searchController) {
        self.controller = conroller
    }
    
    var body: some View {
        VStack {
            ForEach(controller.searchRowObjectPositions, id: \.self) { array in
                if array.count == 3 {
                    SearchResultsThreePosterRow(object1: array[0], object2: array[1], object3: array[2], searchController: self.controller).environment(\.managedObjectContext, self.managedObjectContext)
                } else if array.count == 2 {
                    SearchResultsThreePosterRow(object1: array[0], object2: array[1], searchController: self.controller).environment(\.managedObjectContext, self.managedObjectContext)
                } else if array.count == 1 {
                    SearchResultsThreePosterRow(object1: array[0], searchController: self.controller).environment(\.managedObjectContext, self.managedObjectContext)
                }
            }
        }
    }
}

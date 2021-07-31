//
//  SearchResults.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 31/07/2021.
//

import SwiftUI

struct SearchResults: View {
    
    let controller: searchController
    
    var body: some View {
        VStack {
            Text("Results bitches")
            ForEach(controller.searchRowObjectPositions, id: \.self) {array in
                if array.count == 3 {
                    SearchResultsThreePosterRow(object1: array[0], object2: array[1], object3: array[2], searchController: self.controller)
                    print("array.count == \(array.count)")
                } else if array.count == 2 {
                    SearchResultsThreePosterRow(object1: array[0], object2: array[1], searchController: self.controller)
                } else if array.count == 1 {
                    SearchResultsThreePosterRow(object1: array[0], searchController: self.controller)
                }
                
            }
        }
    }
}

struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        SearchResults(controller: searchController())
    }
}

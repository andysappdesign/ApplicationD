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
            ForEach(controller.searchRowObjectPositions, id: \.self) { array in
                Text("Hello")
            }
        }
    }
}

struct SearchResults_Previes: PreviewProvider {
    static var previews: some View {
        SearchResults(controller: searchController())
    }
}

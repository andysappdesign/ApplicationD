//
//  MovieDiscover.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 29/07/2021.
//

import SwiftUI

struct MovieDiscover: View {
    
    @ObservedObject var controller: searchController
    
    var body: some View {
        ZStack {
            Color("#ECF39E")
            VStack {
                ForEach(controller.discoverRowObjectPositions, id: \.self) {array in
                    if array.count == 3 {
                        DiscoverThreePosterRow(object1: array[0], object2: array[1], object3: array[2], searchController: self.controller)
                    } else if array.count == 2 {
                        DiscoverThreePosterRow(object1: array[0], object2: array[1], searchController: self.controller)
                    } else if array.count == 1 {
                        DiscoverThreePosterRow(object1: array[0], searchController: self.controller)
                    }
                    
                }
            }
        }
    }
}

struct MovieDiscover_Previews: PreviewProvider {
    static var previews: some View {
        MovieDiscover(controller: searchController())
    }
}

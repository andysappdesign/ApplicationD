//
//  MovieDiscover.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 29/07/2021.
//
//  This sub-View helps form the rows of Movie Posters in the Discover View

import SwiftUI
import CoreData

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

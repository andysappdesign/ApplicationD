//
//  DiscoverThreePosterRow.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 31/07/2021.
//

import SwiftUI
import CoreData

struct DiscoverThreePosterRow: View {
    
    let GUISize = GUISizes()
    let moc: NSManagedObjectContext
    var size = GUISizes.Sizes.small
    
    let object1: JSONMovieObject
    let object2: JSONMovieObject
    let object3: JSONMovieObject
    
    init(object1: Int, object2: Int, object3: Int, searchController: searchController, moc: NSManagedObjectContext) {
        self.object1 = searchController.objectDiscoverArray[object1]
        self.object2 = searchController.objectDiscoverArray[object2]
        self.object3 = searchController.objectDiscoverArray[object3]
        self.moc = moc
    }
    
    // Two Objects
    
    init(object1: Int, object2: Int, searchController: searchController, moc: NSManagedObjectContext) {
        self.object1 = searchController.objectDiscoverArray[object1]
        self.object2 = searchController.objectDiscoverArray[object2]
        self.object3 = JSONMovieObject()
        self.moc = moc
    }
    
    // One Object
    init(object1: Int, searchController: searchController, moc: NSManagedObjectContext) {
        self.object1 = searchController.objectDiscoverArray[object1]
        self.object2 = JSONMovieObject()
        self.object3 = JSONMovieObject()
        self.moc = moc
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                NavigationLink(destination: Indervidual_Information(object: object1, moc: self.moc)
                ) {
                    MoviePoster(size: self.size, urlString: object1.poster_path)
                }
                
            }
            Spacer()
            VStack {
                if object2.title != "" {
                    NavigationLink(destination: Indervidual_Information(object: object2, moc: self.moc)
                    ) {
                        MoviePoster(size: self.size, urlString: object2.poster_path)
                        
                    }
                    
                }
                else {
                    blankMoviePosition(size: self.size)
                }
                
            }
            Spacer()
            VStack {
                if object3.title != "" {
                    NavigationLink(destination: Indervidual_Information(object: object3, moc: self.moc)
                    ) {
                        MoviePoster(size: self.size, urlString: object3.poster_path)
                    }
                }
                else {
                    blankMoviePosition(size: self.size)
                }
            }
            Spacer()
        } // end of HStack
        .frame(width: GUISize.rowWidth, height: GUISize.smallPosterHeight + 10)
        .background(Color(ContentView.colourString))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}


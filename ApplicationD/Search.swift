//
//  Search.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 29/07/2021.
//

import SwiftUI

struct Search: View {
    
    let GUISize = GUISizes()
    @ObservedObject var controlller: searchController
    @State var userSearchText: String = ""
    @State var searchResults: Bool = false
    @State var searchError: Bool = false
    
    init() {
        controlller = searchController()
        controlller.discoverMovies {
            print("discovered movies")
        }
    }
    
    var body: some View {
        ZStack {
            Color("#ECF39E")
            VStack{
                Form() {
                    TextField("Search for", text: $userSearchText)
                    
                }.frame(height: GUISize.searchFormHeight)
                Button(action: {
                    if controlller.searchIsNotEmpty(query: self.userSearchText) == true {
                        controlller.search(title: self.userSearchText)
                        self.searchResults = true
                        self.searchError = false
                        print("search")
                    } else {
                        self.searchError = true
                    }
                                        }) {
                    CustomButtonLayout(size: .medium, text: "Submit")
                }.alert(isPresented: $searchError, content: {
                    Alert(title: Text("Search Query is empty"), dismissButton: .default(Text("OK")))
                })
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("#ECF39E"))
                        ScrollView {
                            if self.searchResults == false {
                                MovieDiscover(controller: self.controlller)
                            } else {
                                SearchResults(controller: self.controlller)
                            }
                        }
                    }
                    bottomBar()
                }
                
                
            }
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}

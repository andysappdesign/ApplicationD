//
//  Search.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 29/07/2021.
//
//  This creates the Search view, this view works with the Search Contoller 

import SwiftUI

struct Search: View {
    
    @ObservedObject var controlller: searchController
    @State var userSearchText: String = ""
    @State var searchResults: Bool = false
    @State var searchError: Bool = false
    
    init() {
        controlller = searchController()
        controlller.discoverMovies {
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
                        hideKeyboard()
                        controlller.search(title: self.userSearchText) {
                            
                        }
                        self.searchResults = true
                        self.searchError = false
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
                                SearchResults(conroller: self.controlller)
                            }
                        }
                    }
                    BottomBar()
                }
                
                
            }
        }
    }
}

//struct Search_Previews: PreviewProvider {
//    static var previews: some View {
//        Search()
//    }
//}

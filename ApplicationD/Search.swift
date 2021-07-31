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
                        controlller.search(title: self.userSearchText)}) {
                    customButtonLayout(size: .medium, text: "Submit")
                }
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("#ECF39E"))
                        MovieDiscover(controller: self.controlller)
                        
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

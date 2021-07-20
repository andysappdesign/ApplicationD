//
//  Indervidual Information.swift
//  
//
//  Created by Andrew Cumming on 19/07/2021.
//

import SwiftUI

struct Indervidual_Information: View {
    
    let GUISize = GUISizes()
    let overview: String
    let movieID: Int = 508943
    let castRowController: CastRowController
    @State var castBoxBool = false
    
    init(overview: String) {
        UINavigationBar.appearance().backgroundColor = UIColor(Color("#31572c"))
        self.overview = overview
        self.castRowController = CastRowController(movieID: self.movieID)
        self.castRowController.populateCastRow()
    }
    
    var body: some View {
        ZStack {
            Color("#ECF39E")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Pirates of the Caribean: The Curse of the Black Pearl")
                    .font(GUISize.titleFont)
                    .fontWeight(GUISize.titleWeight)
                    .multilineTextAlignment(.center)
                    .foregroundColor(GUISize.titleColor)
                    .shadow(color: GUISize.titleShadowColor, radius: GUISize.titleShadowRadius, x: GUISize.titleShadowX, y: GUISize.titleShadowY)
                HStack {
                    Spacer()
                    MoviePoster(size: .medium, urlString: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/z8onk7LV9Mmw6zKz4hT6pzzvmvl.jpg")
                        .padding(.leading)
                    Spacer()
                    OverViewBox(boxHeight: GUISize.mediumPosterHeight, boxWidth: GUISize.indervidualInformationOverviewBoxWidth, overview: self.overview)
                        .padding(.trailing)
                        
                    Spacer()
                }
                    .frame(width: GUISize.screenWidth)
                Spacer()
                    .frame(height: 4)
                HStack{
                    Spacer()
                    customButtonLayout(text: "Trailer Link")
                    Spacer()
                    VStack {
                        Text("Released in 2003")
                            .font(.headline)
                            .fontWeight(.medium)
                        Spacer()
                        HStack {
                            Button(action: self.toggleCast, label: {
                                Text("Cast")
                            })
                        }
                        
                    }
                    Spacer()
                    
                }
                .frame(width: GUISize.rowWidth, height: GUISize.twoButtonRow_ButtonHeight)
                Spacer()
                    .frame(height: 10)
                if self.castBoxBool == true {
                    CastRow(movieID: self.movieID)
                } else {
                        Rectangle()
                            .frame(width: GUISize.rowWidth, height:2.5)
                            .foregroundColor(Color("#31572c"))
                }
                
                Spacer()
                bottomBar()
            } // end of HStack
            .frame(width: GUISize.screenWidth)
        } // end of ZStack
        
    } // end of view
    
    // MARK:- toggleCast
    
    func toggleCast() {
        self.castBoxBool.toggle()
    }
    
}

struct Indervidual_Information_Previews: PreviewProvider {
    static var previews: some View {
        Indervidual_Information(overview: "Jack Sparrow, a freewheeling 18th-century pirate, quarrels with a rival pirate bent on pillaging Port Royal. When the governor's daughter is kidnapped, Sparrow decides to help the girl's love save her.")
    }
}

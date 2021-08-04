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
    let movieID: Int
    let movieTitle: String
    let posterString: String
    let castRowController: CastRowController
    @State var castBoxBool = false
    
    init(object: JSONMovieObject) {
        UINavigationBar.appearance().backgroundColor = UIColor(Color("#31572c"))
        self.movieID = object.id
        self.overview = object.overview
        self.movieTitle = object.title
        self.posterString = object.poster_path
        self.castRowController = CastRowController(movieID: self.movieID)
        self.castRowController.populateCastRow()
    }
    
    var body: some View {
        ZStack {
            Color("#ECF39E")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text(self.movieTitle)
                    .font(GUISize.titleFont)
                    .fontWeight(GUISize.titleWeight)
                    .multilineTextAlignment(.center)
                    .foregroundColor(GUISize.titleColor)
                    .shadow(color: GUISize.titleShadowColor, radius: GUISize.titleShadowRadius, x: GUISize.titleShadowX, y: GUISize.titleShadowY)
                HStack {
                    Spacer()
                    MoviePoster(size: .medium, urlString: self.posterString)
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
                    CustomButtonLayout(size: .medium, text: "Trailer Link")
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
                    CastRow(controller: self.castRowController)
                } else {
                        Rectangle()
                            .frame(width: GUISize.rowWidth, height:2.5)
                            .foregroundColor(Color("#31572c"))
                }
                Spacer()
                HStack {
                    VStack{
                        Spacer()
                        CustomButtonLayout(size: .small, text: "30 points")
                        Spacer()
                        CustomButtonLayout(size: .small, text: "Collection")
                        Spacer()
                    }
                    Spacer()
                    RatingsBox(testing: true, boxWidth: GUISize.indervidualInformationOverviewBoxWidth, boxHeight: GUISize.indervidualInformationRatingsBoxHeight)
                } .frame(width: GUISize.rowWidth)
                
                Spacer()
                bottomBar()
            }
            .frame(width: GUISize.screenWidth)
        } // end of ZStack
        
    } // end of view
    
    // MARK:- toggleCast
    
    func toggleCast() {
        self.castBoxBool.toggle()
    }
    
}

//struct Indervidual_Information_Previews: PreviewProvider {
//    static var previews: some View {
//        let object = JSONMovieObject(id: 1, video: true, original_language: "", overview: "", backdrop_path: "", adult: false, vote_count: 1, vote_average: 1, orginal_title: "", release_date: "", popularity: 0.00, title: "Monsters at Work", poster_path: "2gxgwhcuSmI5xtexb0t9zGj43FS.jpg", genre_ids: [])
//
//        Indervidual_Information(object: object)
//    }
//}

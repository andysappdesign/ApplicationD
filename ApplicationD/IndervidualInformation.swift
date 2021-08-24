//
//  IndervidualInformation.swift
//  
//
//  Created by Andrew Cumming on 19/07/2021.
//
//  This view displays the Indervidual Information of a Movie Object

import SwiftUI

struct IndervidualInformation: View {
    
    let generator = FriendsAndPointsGenerator()
    var genratedFriends: [String] = []
    var genratedScores: [Double] = []
    let overview: String
    let movieID: Int
    let movieTitle: String
    let posterString: String
    let release: String
    let castRowController: CastRowController
    let collectionController: CollectionsController
    @ObservedObject var indervidualInformationController: StateChangeController
    @State var castBoxBool = false
    
    init(object: JSONMovieObject) {
        UINavigationBar.appearance().backgroundColor = UIColor(Color("#31572c"))
        self.movieID = object.id
        self.overview = object.overview
        self.movieTitle = object.title
        self.posterString = object.poster_path
        self.release = object.release_date
        self.castRowController = CastRowController(movieID: self.movieID)
        castRowController.populateCastRow()
        self.collectionController = CollectionsController()
        collectionController.getMovieCollection(id: self.movieID)
        self.indervidualInformationController = StateChangeController()
        self.genratedFriends = generator.generateFriends(howMany: 2)
        self.genratedScores = generator.generateReviewScore()
    }
    
    var body: some View {
        ZStack {
            Color("#ECF39E")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text(self.movieTitle)
                    .font(GUISize.dynamicTitleFont)
                    .fontWeight(GUISize.titleWeight)
                    .multilineTextAlignment(.center)
                    .foregroundColor(GUISize.titleColor)
                    .shadow(color: GUISize.titleShadowColor, radius: GUISize.titleShadowRadius, x: GUISize.titleShadowX, y: GUISize.titleShadowY)
                HStack {
                    Spacer()
                    MoviePoster(size: .medium, urlString: self.posterString)
                        .padding(.leading)
                    Spacer()
                    OverViewBox(boxHeight: GUISize.mediumPosterHeight, boxWidth: GUISize.indervidualInformation_OverviewBoxWidth, overview: self.overview)
                        
                        .padding(.trailing)
                    
                    Spacer()
                }
                .frame(width: GUISize.screenWidth)
                Spacer()
                    .frame(height: 4)
                HStack{
                    Spacer()
                    CustomButtonLayout(size: .medium, text: "Trailer Link", inActive: true)
                    Spacer()
                    VStack {
                        Text("Released on \(self.release)")
                            .font(GUISize.dynamicBodyFont)
                            .fontWeight(.medium)
                            .frame(width: (GUISize.indervidualInformation_OverviewBoxWidth / 3) * 2)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                        
                        HStack {
                            Button(action: self.toggleCast, label: {
                                Text("Cast")
                                    .font(GUISize.dynamicBodyFont)
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
                        if collectionController.inCollection == true {
                            NavigationLink(destination: CollectionView(id: collectionController.collectionID, name: collectionController.collection.name)) {
                                CustomButtonLayout(size: .small, text: collectionController.collection.name)
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                    RatingsBox(firstFriendName: self.genratedFriends[0], firstFriendRating: self.genratedScores[0], secondFriendName: self.genratedFriends[1], secondFriendRating: self.genratedScores[1])
                } .frame(width: GUISize.rowWidth)
                
                Spacer()
                BottomBar()
            }
            .frame(width: GUISize.screenWidth)
        } // end of ZStack
        .navigationBarItems(trailing: Button(action: {
            indervidualInformationController.changeStateAlert.toggle()
        }) {
            Image(systemName: "ticket")
                .foregroundColor(Color("#ECF39E"))
        })
        .sheet(isPresented: $indervidualInformationController.changeStateAlert, content: {
            StateChangeSheet(movieId: self.movieID, controller: self.indervidualInformationController)
        })
    } // end of view
    
    // MARK:- toggleCast
    
    func toggleCast() {
        self.castBoxBool.toggle()
    }
    
}

struct IndervidualInformation_Previews: PreviewProvider {
    static var previews: some View {
        let object = JSONMovieObject(id: 1, video: true, original_language: "", overview: "", backdrop_path: "", adult: false, vote_count: 1, vote_average: 1, orginal_title: "", release_date: "", popularity: 0.00, title: "Monsters at Work", poster_path: "2gxgwhcuSmI5xtexb0t9zGj43FS.jpg", genre_ids: [], media_type: "movie")
        
        IndervidualInformation(object: object)
    }
}

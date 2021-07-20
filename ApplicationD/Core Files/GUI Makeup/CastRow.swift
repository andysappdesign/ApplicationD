//
//  CastRow.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 19/07/2021.
//

import SwiftUI

struct CastRow: View {
    
    let GUISize = GUISizes()
    @ObservedObject var controller: CastRowController
    
    init(controller: CastRowController) {
        self.controller = controller
    }
    
    init(TESTINGid: Int) {
        self.controller = CastRowController(movieID: TESTINGid)
        controller.populateCastRow()
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke()
                .shadow(radius: 3)
                .clipShape(Rectangle())
                .foregroundColor(.white)
                .background(Color.white)
                .border(Color("#31572c"), width: 2)
                .frame(width: GUISize.castBoxWidth)

            HStack {
                Spacer()
                VStack{
                    MoviePoster(size: .extraSmall, urlString: controller.firstPersonURL)
                    Text(controller.firstPersonName)
                    Text(controller.firstPersonCharacter)
                }
                Spacer()
                VStack{
                    MoviePoster(size: .extraSmall, urlString: controller.secondPersonURL)
                    Text(controller.secondPersonName)
                    Text(controller.secondPersonCharacter)
                }
                Spacer()
                VStack{
                    MoviePoster(size: .extraSmall, urlString: controller.thirdPersonURL)
                    Text(controller.thirdPersonName)
                    Text(controller.thirdPersonCharacter)
                }
                Spacer()
                VStack {
                    MoviePoster(size: .extraSmall, urlString: controller.fourthPersonURL)
                    Text(controller.fourthPersonName)
                    Text(controller.fourthPersonCharacter)
                }
                Spacer()
            }
            .frame(width: GUISize.rowWidth)
        }
        .frame(width: GUISize.rowWidth, height: GUISize.smallPosterHeight + 10)
    }
}

struct CastRow_Previews: PreviewProvider {
    static var previews: some View {
        CastRow(TESTINGid: 508943)
    }
}

//
//  CastRow.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 19/07/2021.
//

import SwiftUI

struct CastRow: View {
    
    @ObservedObject var controller: CastRowController
    
    let actorText: Font = .custom("SFProText", size: 10)
    let actorWeight: Font.Weight = .medium
    let characterText: Font = .custom("SFProText", size: 8)
    let characterWeight: Font.Weight = .thin
    
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
                    Spacer()
                    MoviePoster(size: .extraSmall, urlString: controller.firstPersonURL)
                    Text(controller.firstPersonName)
                        .font(self.actorText)
                        .fontWeight(self.actorWeight)
                    Text(controller.firstPersonCharacter)
                        .font(self.characterText)
                        .fontWeight(self.characterWeight)
                    Spacer()
                }
                Spacer()
                VStack{
                    Spacer()
                    MoviePoster(size: .extraSmall, urlString: controller.secondPersonURL)
                    Text(controller.secondPersonName)
                        .font(self.actorText)
                        .fontWeight(self.actorWeight)
                    Text(controller.secondPersonCharacter)
                        .font(self.characterText)
                        .fontWeight(self.characterWeight)
                    Spacer()
                }
                Spacer()
                VStack{
                    Spacer()
                    MoviePoster(size: .extraSmall, urlString: controller.thirdPersonURL)
                    Text(controller.thirdPersonName)
                        .font(self.actorText)
                        .fontWeight(self.actorWeight)
                    Text(controller.thirdPersonCharacter)
                        .font(self.characterText)
                        .fontWeight(self.characterWeight)
                    Spacer()
                }
                Spacer()
                VStack {
                    Spacer()
                    MoviePoster(size: .extraSmall, urlString: controller.fourthPersonURL)
                    Text(controller.fourthPersonName)
                        .font(self.actorText)
                        .fontWeight(self.actorWeight)
                    Text(controller.fourthPersonCharacter)
                        .font(self.characterText)
                        .fontWeight(self.characterWeight)
                    Spacer()
                }
                Spacer()
            }
            .frame(width: GUISize.rowWidth)
            .multilineTextAlignment(.center)
            
        }
        .frame(width: GUISize.rowWidth, height: GUISize.smallPosterHeight + 20)
    }
}

//struct CastRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CastRow(TESTINGid: 508943)
//    }
//}

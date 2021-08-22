//
//  TutorialPage.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/05/2021.
//
//  This sub-View creates the Tutorial Page, this has been had minimual attentition in this version of the app

import SwiftUI

struct TutorialPage: View {
    
    let image: String
    let title: String
    let subtitle: String
    let showNextButton: Bool
    @Binding var hasCompletedPart1: Bool
    
    var body: some View {
        
        VStack {
            Image(systemName: self.image)
                .resizable()
                .aspectRatio(contentMode:  .fit)
                .frame(width: 150, height: 150)
                .padding()
            
            Text(self.title)
                .font(.system(size: 32))
                .padding()
            
            Text(self.subtitle)
                .font(.system(size: 24))
                .foregroundColor(Color(.secondaryLabel))
                .padding()
            
            if self.showNextButton {
                Button(action: {
                    self.hasCompletedPart1.toggle()
                }, label: {
                    Text("Continue")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(6)
                })
            }
        }
    }
}

//struct TutorialPage_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialPage(image: "bell", title: "Push Notifications", subtitle: "Enable the notifaications to stay up to date.", showNextButton: true)
//    }
//}

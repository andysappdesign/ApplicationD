//
//  Onboarding.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 10/05/2021.
//

import SwiftUI

struct Onboarding: View {
    
    @Binding var hasCompletedOnboarding: Bool
    @State var hasCompletedPart1 = false
    
    
    var body: some View {
        if !hasCompletedPart1 {
            TabView {
                TutorialPage(image: "bell", title: "hello", subtitle: "greetings", showNextButton: false, hasCompletedPart1: $hasCompletedPart1)
                    .background(Color.red)
                
                TutorialPage(image: "bell", title: "bonjour", subtitle: "a demain", showNextButton: false, hasCompletedPart1: $hasCompletedPart1)
                    .background(Color.blue)
                
                TutorialPage(image: "bell", title: "salut", subtitle: "encante", showNextButton: false, hasCompletedPart1: $hasCompletedPart1)
                    .background(Color.green)
                
                TutorialPage(image: "bell", title: "welcome", subtitle: "bye!", showNextButton: true, hasCompletedPart1: $hasCompletedPart1)
                    .background(Color.orange)
            }
            .tabViewStyle(PageTabViewStyle())
        } else {
            userCreationMain(isOnboarding: $hasCompletedOnboarding)
        }
    }
}

//struct Onboarding_Previews: PreviewProvider {
//    static var previews: some View {
//        Onboarding(hasCompletedOnboarding: t)
//    }
//}

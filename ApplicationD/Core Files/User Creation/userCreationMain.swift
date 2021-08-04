//
//  userCreationMain.swift
//  Application D
//
//  Created by Andrew Cumming on 28/03/2021.
//

import SwiftUI

struct userCreationMain: View {
    
    // This stucture is the master view for user creation and allows the screens
    // to change once completed.
    
    @Environment(\.presentationMode) var present
    @ObservedObject var helper: userCreationHelper
    
    
    // MARK: - init
    
    init(isOnboarding: Binding<Bool>) {
        self.helper = userCreationHelper.init(Onboarded: isOnboarding)
    }
    
    var body: some View {
        if helper.screencount == 1 {
            userCreation1(helper: self.helper)
        } else if helper.screencount == 2 {
            userCreation2(helper: self.helper)
            } else if helper.screencount >= 3 {
                    Text("Error: screen count is \(helper.screencount)")
                }
    } // end of body
    
}


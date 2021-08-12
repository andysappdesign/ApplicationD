//
//  MyProfile.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 12/08/2021.
//

import SwiftUI

struct MyProfile: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9254901961, green: 0.9529411765, blue: 0.6196078431, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("My Profile")
                Spacer()
                Text("My Total Points are")
                Text("\(UserDefaults.standard.integer(forKey: "totalPoints"))")
                Spacer()
                bottomBar()
            }
        }
        
    }
}

struct MyProfile_Previews: PreviewProvider {
    static var previews: some View {
        MyProfile()
    }
}

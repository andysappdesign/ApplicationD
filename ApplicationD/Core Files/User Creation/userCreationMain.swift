//
//  userCreationMain.swift
//  Application D
//
//  Created by Andrew Cumming on 28/03/2021.
//

import SwiftUI
import CoreData

struct userCreationMain: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var present
    @ObservedObject var helper: userCreationHelper
    
    // MARK: - init
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.helper = userCreationHelper.init(moc: managedObjectContext)
        print("userCreationMain called & opening screen 1")
    }
    
    var body: some View {
        if helper.screencount == 1 {
            userCreation1()
        } else if helper.screencount == 2 {
                userCreation2()
            } else if helper.screencount >= 3 {
                    Text("Error: screen count is \(helper.screencount)")
                }
    } // end of body
    
}

//struct userCreationMain_Previews: PreviewProvider {
//    static var previews: some View {
//        userCreationMain()
//    }
//}

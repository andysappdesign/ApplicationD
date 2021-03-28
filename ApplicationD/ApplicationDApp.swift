//
//  ApplicationDApp.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 28/03/2021.
//

import SwiftUI

@main
struct ApplicationDApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

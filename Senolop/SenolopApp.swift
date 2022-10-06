//
//  SenolopApp.swift
//  Senolop
//
//  Created by Wallace Silva on 06/10/22.
//

import SwiftUI

@main
struct SenolopApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

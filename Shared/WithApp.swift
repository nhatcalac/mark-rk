//
//  WithApp.swift
//  Shared
//
//  Created by Nhất Minh on 11/06/2022.
//

import SwiftUI

@main
struct WithApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

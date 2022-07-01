//
//  WithApp.swift
//  Shared
//
//  Created by Nhất Minh on 11/06/2022.
//

import SwiftUI
import Firebase
@main
struct WithApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(AuthPageViewModel())
            .environmentObject(PersistenceViewModel())
        }
    }
}

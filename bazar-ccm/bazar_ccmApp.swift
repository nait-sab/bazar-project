//
//  bazar_ccmApp.swift
//  bazar-ccm
//
//  Created by etudiant on 21/09/2022.
//

import SwiftUI
import Firebase

@main
struct bazar_ccmApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

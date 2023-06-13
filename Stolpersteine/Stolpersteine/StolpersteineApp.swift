//
//  StolpersteineApp.swift
//  Stolpersteine
//
//  Created by Radolina on 06/06/2023.
//

import SwiftUI

@main
struct StolpersteineApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(LanguageManager.shared)
        }
    }
}

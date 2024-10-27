//
//  HogwartsArchivesApp.swift
//  HogwartsArchives
//
//  Created by Izabela Marcinkowska on 2024-10-25.
//

import SwiftUI

@main
struct HogwartsArchivesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Student.self, Wand.self])
    }
}

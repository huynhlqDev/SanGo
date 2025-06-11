//
//  SanGoApp.swift
//  SanGo
//
//  Created by huynh on 11/6/25.
//

import SwiftUI
import SwiftData

@main
struct SanGoApp: App {
    var sharedModelContainer: ModelContainer = {
        let modelTypes: [any PersistentModel.Type] = [FootballField.self]
        let schema = Schema(modelTypes)
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}

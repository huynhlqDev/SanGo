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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var scenePhase

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
                .onChange(of: scenePhase) {
                    switch scenePhase {
                    case .background:
                        print("App entered background")
                    case .inactive:
                        print("App went inactive")
                    case .active:
                        print("App became active")
                    @unknown default:
                        break
                    }
                }
                .task {
                    // Request location permission
                }
        }
        .modelContainer(sharedModelContainer)
    }
}

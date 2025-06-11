//
//  ContentView.swift
//  SanGo
//
//  Created by huynh on 11/6/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [FootballField]

    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Tìm kiếm", systemImage: "magnifyingglass")
                }
            MyFieldsView()
                .tabItem {
                    Label("Sân của tôi", systemImage: "soccerball")
                }
            AccountView()
                .tabItem {
                    Label("Tài khoản", systemImage: "person.crop.circle")
                }
        }

    }
}

#Preview {
    HomeView()
        .modelContainer(for: FootballField.self, inMemory: true)
}

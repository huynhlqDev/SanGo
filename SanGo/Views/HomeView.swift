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
    @StateObject private var locationManager = LocationManager()
    @StateObject private var searchViewModel = SearchViewModel()

    var body: some View {
        TabView {
            SearchView(locationManager: locationManager, viewModel: searchViewModel)
                .tabItem {TabItem.search}
            MyFieldsView()
                .tabItem {TabItem.myField}
            AccountView()
                .tabItem {TabItem.myAccount}
        }
        .tint(Color.color4)
        .preferredColorScheme(.light)
    }
}

#Preview {
    HomeView()
        .modelContainer(for: FootballField.self, inMemory: true)
}

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
    @StateObject private var searchViewModel = SearchViewModel()
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                SearchView(viewModel: searchViewModel)
                    .tabItem {TabItem.search}.tag(0)
                
                MyFieldsView()
                    .tabItem {TabItem.myField}.tag(1)
                
                AccountView()
                    .tabItem {TabItem.myAccount}.tag(2)
            }
            .tint(Color.color4)
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: FootballField.self, inMemory: true)
}

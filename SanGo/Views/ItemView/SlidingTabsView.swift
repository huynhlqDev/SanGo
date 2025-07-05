//
//  SlidingTabsView.swift
//  SanGo
//
//  Created by huynh on 5/7/25.
//

import SwiftUI

struct SlidingTabsView: View {
    var tabs: [String] = ["Tab 1", "Tab 2", "Tab 3"]
    @State private var selectedIndex = 0
    @State private var selectedTabIndex = 0
    @Namespace private var underlineNamespace

    var body: some View {
        VStack(spacing: 0) {
            // Tabs
            HStack(spacing: 0) {
                ForEach(tabs.indices, id: \.self) { index in
                    Button {
                        changeTabIndex(to: index)
                    } label: {
                        VStack(spacing: 0) {
                            Text(tabs[index])
                                .foregroundColor(selectedIndex == index ? .blue : .gray)
                                .fontWeight(selectedIndex == index ? .bold : .regular)
                                .padding(.vertical, 8)

                            // underline
                            ZStack {
                                if selectedIndex == index {
                                    Capsule()
                                        .fill(Color.blue)
                                        .matchedGeometryEffect(id: "underline", in: underlineNamespace)
                                        .frame(height: 3)
                                } else {
                                    Color.clear.frame(height: 3)
                                }
                            }
                            Color.gray.frame(height: 1)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.top, 16)
            .padding(.bottom, 8)
            .background(Color.white)

            // Paging content
            TabView(selection: $selectedTabIndex) {
                ForEach(tabs.indices, id: \.self) { index in
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(0..<10) { i in
                                Text("Nội dung Tab \(index + 1) - \(i)")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue.opacity(0.1))
                            }
                        }
                        .padding()
                    }
                    .scrollIndicators(.hidden)
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: selectedTabIndex) { _, newValue in
                changeSelectionIndex(to: newValue)
            }
        }
    }

    private func changeSelectionIndex(to index: Int) {
        withAnimation {
            selectedIndex = index
        }
    }

    private func changeTabIndex(to index: Int) {
        withAnimation {
            selectedTabIndex = index
        }
    }
}

#Preview {
    SlidingTabsView()
}

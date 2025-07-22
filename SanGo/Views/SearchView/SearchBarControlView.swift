//
//  SearchBarControlView.swift
//  SanGo
//
//  Created by huynh on 9/7/25.
//

import SwiftUI

struct SearchBarControlView: View {
    // MARK: PROPERTIES
    /// Data
    @ObservedObject var viewModel: SearchViewModel
    @State private var dateFilterValue: Date = Date.now

    /// State for layout view
    var searchBarControlHidden: Bool = false

    /// State management values
    @State private var isShowSearchDetail: Bool = false

    /// State management dynamic SearchBar values
    @State private var pannerText: String = "Tìm kiếm sân"
    @State private var pannerIndex: Int = 0
    @State private var textOffset: CGFloat = 0

    /// Default values
    private let searchButtonHeight: CGFloat = 48
    private let timer = Timer.publish(
        every: 2,
        on: .main,
        in: .common
    ).autoconnect()

    private var searchControl: some View {
        let pannerTextList: [String] = [
            "Tìm kiếm sân",
            "Thêm thành phố",
            "Thêm phường,xã"
        ]
        return (
            VStack(spacing: 0) {
                if viewModel.displayMode == .list {
                    /// Welcome - notification - avatar(optional)
                    HStack {
                        /// My location
                        VStack(alignment: .leading) {
                            Text("My location")
                                .font(.caption)
                                .foregroundStyle(.white)
                            Text("Da Nang, Viet Nam")
                                .font(.body)
                                .foregroundStyle(.white)
                        }

                        Spacer()

                        /// Notification button
                        Button(action: {
                            print("Notification tapped")
                        }, label: {
                            Image(systemName: "bell")
                                .resizable()
                                .foregroundStyle(.white)
                                .frame(width: 22, height: 22)
                                .darkShadow()
                                .padding(.horizontal, 12)
                        })

                        /// Avatar button
                        Button(action: {
                            print("Avatar tapped")
                        }, label: {
                            UserImageView(imageURL: URL(string: "https://i.pravatar.cc/100"),
                                          size: 32)
                        })
                    }.offset(x: 0, y: 8)
                }

                /// Search field
                ZStack {
                    Button(action: {
                        isShowSearchDetail = true
                        print("Search field tapped")
                    }, label: {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .bold()
                            Text(pannerText)
                                .offset(CGSize(width: 0, height: textOffset))
                            Spacer()
                        }
                        .font(.body)
                        .foregroundStyle(Color(.systemGray))
                        .padding(.horizontal)
                    })
                }
                .frame(height: searchButtonHeight)
                .background(.white)
                .clipShape(.buttonBorder)
                .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
                .offset(x: 0, y: searchButtonHeight/2)

                // DYNAMIC SEARCH BAR HANDLER
                .onReceive(timer) { _ in
                    pannerIndex = (pannerIndex + 1) % pannerTextList.count
                    pannerText = pannerTextList[pannerIndex]
                }
                .onChange(of: pannerText) { _,_ in
                    withAnimation(.easeOut) {
                        textOffset = 10
                        asyncAfter(0.15, execute: {textOffset = 0})
                    }
                }
            }
        )
    }

    var body: some View {
        if !searchBarControlHidden {
            VStack {
                // SEARCHBAR
                searchControl
                    .padding(.horizontal)
                    .background(viewModel.displayMode == .list ? Color.sanGoApp01 : Color.clear)
                    .padding(.bottom, searchButtonHeight/2) // Cover search field - offset [y: 26]
            }
            .transition(.move(edge: .top).combined(with: .opacity))
            .fullScreenCover(isPresented: $isShowSearchDetail) {
                SearchFieldDetail(viewModel: viewModel)
            }
        }
    }
    private func saveSearchQuery() {
        // TODO: bind data to view model
    }
}

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

    /// State for layout view
    var searchBarControlHidden: Bool = false

    /// State management values
    @State private var isShowSearchDetail: Bool = false
    @State private var isShowDateFilter: Bool = false
    @State private var isShowTimeFilter: Bool = false
    @State private var isShowFieldTypeFilter: Bool = false
    @State private var isShowPriceFilter: Bool = false

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
                        /// Welcome
                        Text("Welcome")
                            .font(.title).bold()
                            .foregroundStyle(.white)

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
                        //TODO: create a action to show search view
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
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    })
                }
                .frame(height: searchButtonHeight)
                .background(Color(hex: "#1F7F7C"))
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

    private var horizontalFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                FilterButton(title: "Ngày", action: {
                    withAnimation {isShowDateFilter = true}
                })
                FilterButton(title: "Khung giờ", action: {
                    withAnimation {isShowTimeFilter = true}
                })
                FilterButton(title: "Loại sân", action: {
                    withAnimation {isShowFieldTypeFilter = true}
                })
                FilterButton(title: "Giá tiền", action: {
                    withAnimation {isShowPriceFilter = true}
                })
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
            .background(.clear)
        }
    }

    var body: some View {
        if !searchBarControlHidden {
            VStack {
                // SEARCHBAR
                searchControl
                    .padding(.horizontal)
                    .background(viewModel.displayMode == .list ? Color(hex: "#67CAAF") : Color.clear)
                    .padding(.bottom, searchButtonHeight/2) // Cover search field - offset [y: 26]

                // HORIZONTAL FILTER
                horizontalFilter.scrollClipDisabled()
            }
            .transition(.move(edge: .top).combined(with: .opacity))
        }
    }
}

//
//  SearchListView.swift
//  SanGo
//
//  Created by huynh on 15/6/25.
//

import SwiftUI
import CoreLocation

struct SearchListView: View {
    // MARK: PROPERTIES
    /// Data
    @ObservedObject var viewModel: SearchViewModel

    /// State for layout view
    @GestureState private var dragOffset = CGSize.zero
    @State private var searchBarControlHidden: Bool = false
    private let triggerDistance: CGFloat = 100


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
    private let pannerTextList: [String] = [
        "Tìm kiếm sân",
        "Thêm thành phố",
        "Thêm phường,xã"
    ]

    private var searchControl: some View {
        VStack(spacing: 0) {
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
        }
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
            .padding(.horizontal).padding(.vertical, 4)
        }
    }

    // MARK: HEADER VIEW
    private var searchBarControl: some View {
        Group {
            // SEARCHBAR
            searchControl
                .padding(.horizontal)
                .background(Color(hex: "#67CAAF"))
                .padding(.bottom, searchButtonHeight/2) // Cover search field - offset [y: 26]

            // HORIZONTAL FILTER
            horizontalFilter.scrollClipDisabled()
        }

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

    // MARK: LIST FIELD
    private var listField: some View {
        Group {
            /// Fields near you
            HStack(spacing: 0) {
                Text("Có ")
                Text("\(viewModel.fields.count)").bold()
                Text(" sân gần bạn")
                Spacer()
            }
            .font(.subheadline)
            .padding(.horizontal).padding(.vertical, 8)

            /// List  field
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.fields, id: \.id) { field in
                        NavigationLink(destination: FieldDetailView(field: field)) {
                            FieldCard(field: field)
                                .padding(.horizontal, 8)
                                .padding(.bottom, 8)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                }
            }
            .simultaneousGesture(
                DragGesture().updating($dragOffset) { value, _, _ in
                    if value.translation.height < (0 - triggerDistance) {
                        withAnimation {searchBarControlHidden = true}
                    }
                    if value.translation.height > triggerDistance {
                        withAnimation {searchBarControlHidden = false}
                    }
                }
            )
        }
    }

    // MARK: BODY VIEW
    var body: some View {
        VStack {
            // HEADER
            if !searchBarControlHidden {
                searchBarControl
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
            // LIST
            listField
        }
        .background(Color(hex: "#F6F6F6"))
        .animation(.easeInOut(duration: 0.25), value: searchBarControlHidden)

        // FETCH DATA
        .task {
            viewModel.fetchFields()
        }
    }
}

#Preview {
    SearchListView(viewModel: SearchViewModel())
}

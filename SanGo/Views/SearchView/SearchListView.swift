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
    @ObservedObject var viewModel: SearchViewModel
    @State private var isShowFieldDetail: Bool = false
    @State private var isShowSearchDetail: Bool = false
    @State private var isShowDateFilter: Bool = false
    @State private var isShowTimeFilter: Bool = false
    @State private var isShowFieldTypeFilter: Bool = false
    @State private var isShowPriceFilter: Bool = false

    private let searchButtonHeight: CGFloat = 48


    // MARK: BODY
    var body: some View {
        GeometryReader { gr in
            VStack {
                // HEADER
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
                                Text("Tìm kiếm sân")
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
                .padding(.horizontal)
                .background(Color(hex: "#67CAAF"))
                .padding(.bottom, searchButtonHeight/2) // Cover search field - offset [y: 26]

                // HORIZONTAL FILTER
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        FilterButton(title: "Ngày", action: {isShowDateFilter = true})
                        FilterButton(title: "Khung giờ", action: {isShowTimeFilter = true})
                        FilterButton(title: "Loại sân", action: {isShowFieldTypeFilter = true})
                        FilterButton(title: "Giá tiền", action: {isShowPriceFilter = true})
                    }
                    .padding(.horizontal).padding(.vertical, 4)
                }.scrollClipDisabled()

                // LIST
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
                List(viewModel.fields) { field in
                    VStack (spacing: 0) {
                        FieldCard(field: field, action: {isShowFieldDetail = true})
                    }
                    .padding(.horizontal, 8)
                    .padding(.bottom, 8)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())

                }
                .listStyle(.plain)
            }
            .background(Color(hex: "#F6F6F6"))

            // FETCH DATA
            .task {
                viewModel.fetchFields()
            }
        }
    }
}

#Preview {
    SearchListView(viewModel: SearchViewModel())
}

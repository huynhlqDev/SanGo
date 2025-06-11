//
//  SearchView.swift
//  SanGo
//
//  Created by huynh on 11/6/25.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel

    @State private var searchText = ""
    @State private var selectedArea = ""
    @State private var selectedTime = ""
    @State private var selectedType = ""
    @State private var selectedPrice = ""

    var body: some View {
        NavigationView {
            VStack {
                // 🔍 Search Bar
                TextField("Nhập quận, thành phố...", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                // 🧰 Bộ lọc
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        FilterChip(filterType: .address, selection: $selectedArea)
                        FilterChip(filterType: .time, selection: $selectedTime)
                        FilterChip(filterType: .fieldType, selection: $selectedType)
                        FilterChip(filterType: .price, selection: $selectedPrice)
                    }
                    .padding(.horizontal)
                }

                // 📋 Danh sách sân
                List(viewModel.fields) { field in
                    FieldCard(field: field)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Tìm sân bóng")

        }
    }
}

//#Preview {
//    SearchView()
//}

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

    // MARK: LIST FIELD
    private var listField: some View {
        let triggerDistance: CGFloat = 100
        return (
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
        )
    }

    // MARK: BODY VIEW
    var body: some View {
        VStack {
            // HEADER
            SearchBarControlView(viewModel: viewModel, searchBarControlHidden: searchBarControlHidden)
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

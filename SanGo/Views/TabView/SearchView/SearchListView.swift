//
//  SearchListView.swift
//  SanGo
//
//  Created by huynh on 15/6/25.
//

import SwiftUI

struct SearchListView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        VStack {
            SearchControlView(viewModel: viewModel)
            List(viewModel.fields) { field in
                VStack (spacing: 0) {
                    FieldCard(field: field, action: {
                        print("tap")
                    })

                    Color.gray.opacity(0.1).frame(height: 4)
                        .padding(.horizontal, -8)
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())

            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .task {
                viewModel.fetchFields()
            }
        }
    }
}

#Preview {
    SearchListView(viewModel: SearchViewModel())
}

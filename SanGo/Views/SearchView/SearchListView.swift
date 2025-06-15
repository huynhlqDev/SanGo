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
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.fields, id: \.id) { field in
                    FieldCard(field: field, action: {
                        print("tap")
                    })
                        .cornerRadius(8)
                        .shadow(color: .black.opacity(0.1), radius: 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                        )
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                }
            }
            .task {
                viewModel.fetchFields()
            }
        }
    }
}

#Preview {
    SearchListView(viewModel: SearchViewModel())
}

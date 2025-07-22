//
//  SearchFieldDetail.swift
//  SanGo
//
//  Created by huynh on 14/7/25.
//

import SwiftUI

struct SearchFieldDetail: View {
    // MARK: PROPERTIES
    @Environment(\.dismiss) var dismiss
    /// Data
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        VStack {
            /// Search field
            ZStack {
                HStack {
                    Image(systemName: "magnifyingglass").bold()
                    ZStack {
                        /// Placeholder
                        if viewModel.searchText.isEmpty {
                            HStack {
                                Text("Tìm kiếm sân")
                                Spacer()
                            }
                        }
                        TextField("", text: $viewModel.searchText)
                    }
                    .font(.body)
                }
                .foregroundColor(.black)
                .padding(.horizontal)
            }
            .frame(height: 48)
            .background(.white)
            .clipShape(.capsule)
            .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4)
            .offset(x: 0, y: 48/2)


            /// List result
            Spacer()

            /// Buttons
            HStack {
                NormalButton(title: "Huỷ", action: {
                    dismiss()
                })
                DangerButton(title: "Áp dụng", action: {

                })
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchFieldDetail(viewModel: SearchViewModel())
}

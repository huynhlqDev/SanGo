//
//  SearchControlView.swift
//  SanGo
//
//  Created by huynh on 14/6/25.
//

import SwiftUI

struct SearchControlView: View {
    // MARK: PROPERTIES
    @ObservedObject var viewModel: SearchViewModel
    var backgroundColor: Color = .color1

    // MARK: VIEW
    var body: some View {
        VStack() {
            SearchBar(provinceText: viewModel.selectedDistrict, onTapAction: {})
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    BaseButton(style: .filter(image: nil), label: viewModel.selectedDistrict)
                    BaseButton(style: .filter(image: nil), label: viewModel.selectedTimeSlot)
                    BaseButton(style: .filter(image: nil), label: viewModel.selectedFielType)
                    BaseButton(style: .filter(image: nil), label: viewModel.selectedMaxPrice)
                }
            }
            .scrollClipDisabled(true)
        }
        .padding()
        .background(backgroundColor)
    }
}

//#Preview {
//    SearchControlView(viewModel: SearchViewModel())
//}

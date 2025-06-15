//
//  SearchView.swift
//  SanGo
//
//  Created by huynh on 11/6/25.
//

import SwiftUI

struct SearchView: View {
    // MARK: PROPERTIES
    @ObservedObject var viewModel: SearchViewModel

    // MARK: View
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                switch viewModel.displayMode {
                case .list:
                    SearchListView(viewModel: viewModel)
                case .map:
                    SearchMapView(viewModel: viewModel)
                }
                BaseButton(
                    style: .dark(image: viewModel.displayMode.image),
                    label: viewModel.displayMode.switchTextButton,
                    action: viewModel.switchDisplayMode
                )
                .padding(8)
            }
        }
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}

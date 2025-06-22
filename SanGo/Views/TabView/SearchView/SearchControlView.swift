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
    @State var isPresented: Bool = false
    var backgroundColor: Color = .color1

    // MARK: VIEW
    var body: some View {
        VStack() {
            SearchBar(provinceText: viewModel.selectedDistrict, onTapAction: {})
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    BaseButton(style: .filter(image: nil),
                               label: viewModel.selectedTimeSlot,
                               action: showFilterDetail)
                    BaseButton(style: .filter(image: nil),
                               label: viewModel.selectedFielType,
                               action: showFilterDetail)
                    BaseButton(style: .filter(image: nil), label: viewModel.selectedMaxPrice,
                               action: showFilterDetail)
                }
            }
            .scrollClipDisabled(true)
        }
        .padding()
        .background(backgroundColor)

        .sheet(isPresented: $isPresented) {
            VStack {
                HStack(alignment: .center) {
                    Text("Loại Sân")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            isPresented = false
                        }
                }
                .padding(12)
                .foregroundStyle(.white)
                .background(Color.color4)
                .frame(maxWidth: .infinity)
                ScrollView {

                }
                HStack {
                    NormalButton(title: "Đặt lại", action: {})
                    DangerButton(title: "Áp dụng", disabled: true, action: hideFilterDetail)
                }
                .padding(.horizontal)
            }
            .presentationDetents([.fraction(0.9)])
            .interactiveDismissDisabled()
        }
    }

    private func showFilterDetail() {
        isPresented = true
    }

    private func hideFilterDetail() {
        isPresented = false
    }
}

#Preview {
    SearchControlView(viewModel: SearchViewModel())
}

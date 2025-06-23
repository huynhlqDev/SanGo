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
    @State var showFilterDetail: Bool = false

    // MARK: VIEW
    var body: some View {
        VStack() {
            SearchBar(provinceText: viewModel.selectedDistrict, onTapAction: {})
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    TrailingIconButton(style: .light,
                                       title: "Ngày",
                                       image: "chevron.down",
                                       imageSize: 8, action: pushFilterDetail)
                    TrailingIconButton(style: .light,
                                       title: "Khung giờ",
                                       image: "chevron.down",
                                       imageSize: 8, action: pushFilterDetail)
                    TrailingIconButton(style: .light,
                                       title: "Loại sân",
                                       image: "chevron.down",
                                       imageSize: 8, action: pushFilterDetail)
                    TrailingIconButton(style: .light,
                                       title: "Giá",
                                       image: "chevron.down",
                                       imageSize: 8, action: pushFilterDetail)
                }
            }
            .scrollClipDisabled(true)
        }
        .padding()
        .background(viewModel.displayMode == .list ? Color.color1 : .clear)
        .sheet(isPresented: $showFilterDetail) {
                TimeSlotFilterView(dismiss: popFilterDetail, searchViewModel: viewModel)
                    .presentationDetents([.fraction(0.9)])
                    .interactiveDismissDisabled()
        }

        .sheet(isPresented: $showFilterDetail) {
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
                            showFilterDetail = false
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
                    DangerButton(title: "Áp dụng", disabled: true, action: popFilterDetail)
                }
                .padding(.horizontal)
            }
            .presentationDetents([.fraction(0.9)])
            .interactiveDismissDisabled()
        }
    }


    func pushFilterDetail() {
        showFilterDetail = true
    }
    func popFilterDetail() {
        showFilterDetail = false
    }
}

#Preview {
    SearchControlView(viewModel: SearchViewModel())
}

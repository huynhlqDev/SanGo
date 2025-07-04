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
        Group {
            VStack(spacing: 12) {
                HStack {
                    SearchBar(provinceText: viewModel.selectedDistrict, onTapAction: {})

                    if viewModel.displayMode == .list {
                        // TODO: load image from API user infomation
                        UserImageView(imageURL: URL(string: "https://i.pravatar.cc/100"))
                            .padding(.horizontal, 8)
                    }
                }

                // Filter collection
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        FilterButton(title: "Ngày", action: pushFilterDetail)
                        FilterButton(title: "Khung giờ", action: pushFilterDetail)
                        FilterButton(title: "Loại sân", action: pushFilterDetail)
                        FilterButton(title: "Giá tiền", action: pushFilterDetail)
                    }
                }.scrollClipDisabled(true)
            }
            .padding(.horizontal, 16).padding(.vertical, 12)
        }
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

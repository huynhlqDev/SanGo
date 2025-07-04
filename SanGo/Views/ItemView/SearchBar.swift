//
//  SearchBarView.swift
//  SanGo
//
//  Created by huynh on 14/6/25.
//

import SwiftUI

struct SearchBar: View {
    var provinceText: String?
    var onTapAction: () -> Void
    private let pannerTextList: [String] = ["Thành phố", "Quận, huyện", "Phường, xã", "Đường phố"]
    private let timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()

    @State private var pannerText: String = "Thành phố"
    @State private var pannerIndex: Int = 0
    @State private var textOffset: CGFloat = 0

    var body: some View {
        HStack {
            // Icon
            Image(systemName: "magnifyingglass")
                .font(.body)
                .padding(.horizontal, 4)
                .foregroundStyle(.black)

            // Title
            VStack {
                Text("Tìm kiếm sân")
                    .font(.subheadline).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.black)
                HStack(spacing: 0) {
                    Text("Thêm ")
                    Text(pannerText)
                        .offset(CGSize(width: 0, height: textOffset))
                }
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.gray)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(6)
        .background(.white)
        .cornerRadius(22)
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.black.opacity(0.3), lineWidth: 1)
        )
        .onReceive(timer) { _ in
            pannerIndex = (pannerIndex + 1) % pannerTextList.count
            pannerText = pannerTextList[pannerIndex]
        }
        .onChange(of: pannerText) { _,_ in
            withAnimation(.easeOut) {
                textOffset = 10
                asyncAfter(0.15, execute: {textOffset = 0})
            }
        }
        .onTapGesture(perform: onTapAction)
    }

}

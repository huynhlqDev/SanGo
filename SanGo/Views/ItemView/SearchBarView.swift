//
//  SearchBarView.swift
//  SanGo
//
//  Created by huynh on 14/6/25.
//

import SwiftUI

struct SearchBarView: View {
    var provinceText: String
    var onTapAction: () -> Void
    private let pannerTextList: [String] = ["Thành phố", "Quận, huyện", "Phường, xã", "Đường phố"]
    private let timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()

    @State private var pannerText: String = "Thành phố"
    @State private var pannerIndex: Int = 0
    @State private var textOffset: CGFloat = 0

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .padding(.horizontal, 8)
            VStack {
                Text(provinceText)
                    .font(.subheadline).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
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
        .foregroundStyle(.black)
        .enableBorder()
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
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

#Preview {
    SearchBarView(provinceText: "Hà Nội", onTapAction: { print("Tapped")})
}

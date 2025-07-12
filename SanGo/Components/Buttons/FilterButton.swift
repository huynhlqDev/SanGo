//
//  FilterButton.swift
//  SanGo
//
//  Created by huynh on 3/7/25.
//

import SwiftUI

struct FilterButton: View {
    var size: ButtonSize = .large
    var title: String
    var disabled: Bool = true
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.callout)
                    .frame(maxWidth: .infinity)
                    .frame(height: 22)
                    .shadow(color: .sango_happy, radius: 15, x: 2, y: 2)
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 10, height: 8)
            }
            .foregroundStyle(Color(hex: "#191919"))
            .padding(.vertical, 10).padding(.horizontal, 16)
            .background(Color(hex: "#FFFFFF"))
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black.opacity(0.3), lineWidth: 0.15)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack {
        FilterButton(size: .mini, title: "Ngày", action: {})
        FilterButton(size: .medium, title: "Khung giờ", action: {})
        FilterButton(size: .large, title: "Loại sân", action: {})
    }
    .padding()
}

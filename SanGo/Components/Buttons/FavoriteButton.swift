//
//  FavoriteButton.swift
//  SanGo
//
//  Created by huynh on 3/7/25.
//

import SwiftUI

enum FavoriteButtonStyle {
    case icon
    case button

    var tintColor: Color {
        switch self {
        case .icon:
            return .white.opacity(0.4)
        case .button:
            return .favorite_fg
        }
    }

    var backgroundColorInside: Color {
        switch self {
        case .icon:
            return .white.opacity(0.4)
        case .button:
            return .favorite_bg_inside
        }
    }

    var backgroundColorOutside: Color {
        switch self {
        case .icon:
            return .clear
        case .button:
            return .favorite_bg_outside
        }
    }
}

struct FavoriteButton: View {
    @Binding var isSelected: Bool

    var style: FavoriteButtonStyle = .icon

    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            ZStack(alignment: .center) {
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(isSelected ? .red: style.backgroundColorInside)
                Image(systemName: "heart")
                    .resizable()
                    .foregroundColor(isSelected ? .red : style.tintColor)
            }
        }
        .frame(width: 22, height: 20)
        .padding(12)
        .background(style.backgroundColorOutside)
        .cornerRadius(22)
        .buttonStyle(.plain)
    }
}

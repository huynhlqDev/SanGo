//
//  BaseButton.swift
//  SanGo
//
//  Created by huynh on 14/6/25.
//

import SwiftUI

enum ButtonStyle {
    case dark
    case light
    case highlight

    var backgroundColor: Color {
        switch self {
        case .dark:  return .black
        case .light: return .white
        case .highlight: return .red
        }
    }
}

struct BaseButton<Content: View>: View {
    var content: () -> Content
    var style: ButtonStyle = .light
    var action: () -> Void = {}

    var body: some View {
        content()
            .padding(.horizontal, 18)
            .padding(.vertical, 12)
            .foregroundStyle(style == .light ? .black : .white)
            .background(style.backgroundColor)
            .cornerRadius(24)
            .shadow(color: .black.opacity(0.1), radius: 6)
            .overlay(RoundedRectangle(cornerRadius: 22)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            .onTapGesture(perform: action)
    }


}

#Preview {
    BaseButton(content: {
        HStack {
            Image(systemName: "map")
                .resizable()
                .frame(width: 20, height: 18)
            Text("Bản đồ").bold()
        }
    })

    BaseButton(content: {
        HStack {
            Text("Khu vực")
            Image(systemName: "chevron.down")
                .resizable()
                .frame(width: 12, height: 8)
        }
    },style: .dark)

    BaseButton(content: {
        HStack {
            Image(systemName: "phone")
                .resizable()
                .frame(width: 12, height: 12)
            Text("0898197577")
        }
    },style: .highlight)
}

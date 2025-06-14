//
//  BaseButton.swift
//  SanGo
//
//  Created by huynh on 14/6/25.
//

import SwiftUI

// MARK: ENUM
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

struct BaseButton: View {
    // MARK: PROPERTIES
    var style: ButtonStyle = .light
    var label: String?
    var image: String?
    var action: () -> Void = {}

    @State private var imageFrame: CGSize = CGSize(width: 20, height: 18)

    // MARK: VIEW
    var body: some View {
        HStack {
            if let image {
                Image(systemName: image)
                    .resizable()
                    .frame(width: imageFrame.width, height: imageFrame.height)
            }
            if let label { Text(label).bold() }
        }
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

    // MARK: PUBLIC METHOD
    func setImageFrame(width: Double = 20, height: Double = 18) -> Self {
        imageFrame = CGSize(width: width, height: height)
        return self
    }
}

#Preview {
    BaseButton(label: "Bản đồ", image: "map")
    BaseButton(label: "Khu vực", image: "chevron.down")
    BaseButton(label: "0898197577", image: "phone")
}

//
//  ButtonSizeEnum.swift
//  SanGo
//
//  Created by huynh on 22/6/25.
//
import SwiftUI

enum ButtonStyleEnum {
    case normal
    case light
    case attention
    case danger

    var backgroundColor: Color {
        switch self {
        case .normal: .clear
        case .light: .clear
        case .attention: .orange
        case .danger: .red
        }
    }

    var foregroundColor: Color {
        switch self {
        case .normal: .black
        case .light: .black
        case .attention: .white
        case .danger: .white
        }
    }
}

enum ButtonSizeEnum {
    case mini
    case normal
    case large

    var height: CGFloat {
        switch self {
        case .mini: 10.0
        case .normal: 16.0
        case .large: 22.0
        }
    }

    var fontSize: CGFloat {
        switch self {
        case .mini:
            return 12.0
        case .normal:
            return 14.0
        case .large:
            return 16.0
        }
    }

    var font: Font {
        switch self {
        case .mini: .footnote
        case .normal: .body
        case .large: .title3
        }
    }
}

#Preview {
    NormalButton(size: .normal, title: "Normal", action: {})
        .padding(.horizontal)
    LightButton(size: .normal, title: "Light", action: {})
        .padding(.horizontal)
    AttentionButton(size: .normal, title: "Normal", action: {})
        .padding(.horizontal)
    DangerButton(size: .normal, title: "Danger", action: {})
        .padding(.horizontal)

}

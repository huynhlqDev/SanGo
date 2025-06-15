//
//  BaseButton.swift
//  SanGo
//
//  Created by huynh on 14/6/25.
//

import SwiftUI

// MARK: ENUM
enum ButtonStyle: Equatable {
    case dark(image: String?)
    case light(image: String?)
    case filter(image: String?)
    case highlight(image: String?)
    case state(enable: Bool, label: String)

    var radius: CGFloat {
        switch self {
        case .state(_, _):
            return 8
        default:
            return 24
        }
    }

    var imageString: String? {
        switch self {
        case .dark(let image): return image
        case .light(let image): return image
        case .highlight(let image): return image
        case .filter(let image): return image
        case .state(_,_): return nil
        }
    }

    var backgroundColor: Color {
        switch self {
        case .dark:  return .black
        case .light: return .white
        case .highlight: return .red
        case .filter: return .white
        case .state(let isEnabled, _):
            if isEnabled {
                return .orange.opacity(0.8)
            } else {
                return .gray
            }
        }
    }

    var foregroundStyle: Color {
        switch self {
        case .dark, .highlight, .state:  return .white
        default: return .black
        }
    }

    private var index: Int {
        switch self {
        case .dark: return 0
        case .light: return 1
        case .filter: return 2
        case .highlight: return 3
        case .state: return 4
        }
    }

    static func ==(lhs: ButtonStyle, rhs: ButtonStyle) -> Bool {
        lhs.index == rhs.index
    }

}

struct BaseButton: View {
    // MARK: PROPERTIES
    var style: ButtonStyle
    var label: String?
    var action: () -> Void = {print("Execute BaseButton action")}

    // MARK: VIEW
    var body: some View {

        HStack {
            switch style {
            case .state(_, let label):
                Text(label)
                    .font(.subheadline).bold()
            case .filter(_):
                if let label {
                    Text(label)
                        .foregroundStyle(.gray)
                }
                if style == .filter(image: nil) {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 8, height: 6)
                }
            default:
                if let image = style.imageString {
                    Image(systemName: image)
                        .resizable()
                        .frame(width: 20, height: 18)
                }
                if let label {
                    Text(label).bold()
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .foregroundStyle(style.foregroundStyle)
        .background(style.backgroundColor)
        .cornerRadius(style.radius)
        .shadow(color: .black.opacity(0.1), radius: 6)
        .overlay(RoundedRectangle(cornerRadius: style.radius)
            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .onTapGesture(perform: action)
    }
}

#Preview {
    BaseButton(style: .filter(image: nil), label: "Thành phố")
    BaseButton(style: .highlight(image: "phone"), label: "bản đồ")
    BaseButton(style: .dark(image: "map"), label: "bản đồ")
    BaseButton(style: .light(image: "checklist.unchecked"), label: "Danh sách")
    BaseButton(style: .state(enable: true, label: "ĐẶT LỊCH"))
    BaseButton(style: .state(enable: false, label: "ĐẶT LỊCH"))
}

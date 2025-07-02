//
//  Extension.swift
//  SanGo
//
//  Created by huynh on 13/6/25.
//
import SwiftUI

// MARK: METHOD
func asyncAfter(_ delay: Double, execute closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: closure)
}

// MARK: COLOR
// refer: https://colorhunt.co/
extension Color {
    //collection 1: https://colorhunt.co/palette/eef5ffb4d4ff86b6f6176b87
    static var color1: Color = Color(hex:"#EEF5FF")
    static var color2: Color = Color(hex:"#B4D4FF")
    static var color3: Color = Color(hex:"#86B6F6")
    static var color4: Color = Color(hex:"#176B87")

    //collection 2: https://colorhunt.co/palette/050c9c3572ef3abef9a7e6ff
    static var sango1: Color = Color(hex:"#050C9C")
    static var sango2: Color = Color(hex:"#3572EF")
    static var sango3: Color = Color(hex:"#3ABEF9")
    static var sango4: Color = Color(hex:"#A7E6FF")

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                            (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,
                            int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue: Double(b) / 255,
                  opacity: Double(a) / 255)
    }
}


// MARK: VIEW
extension View {
    func buttonStyle44(_ background: Color) -> some View {
        self
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .foregroundStyle(background == .white ? .black: .white)
            .background(background)
            .cornerRadius(22)
            .shadow(color: .black.opacity(0.05), radius: 3)
            .overlay(RoundedRectangle(cornerRadius: 22)
                .stroke(Color.black.opacity(0.1), lineWidth: 1)
            )
    }

    func enableBorder(with radius: CGFloat = 24, opacity: Double = 0.3) -> some View {
        self
            .padding(12)
            .background(Color.white)
            .cornerRadius(radius)
            .shadow(color: .black.opacity(0.1), radius: 6)
            .overlay(RoundedRectangle(cornerRadius: radius)
                .stroke(Color.gray.opacity(opacity), lineWidth: 1)
            )
    }
}

// MARK: NAVIGATION CUSTOM
extension View {
    func navigationTitle(title: String,mode displayMode: NavigationBarItem.TitleDisplayMode) -> some View {
        self
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(displayMode)
    }

    func toolbarBackground(with color: Color, for edge: ToolbarPlacement) -> some View {
        self
            .toolbarBackground(color, for: edge)
            .toolbarBackground(.visible, for: edge)
    }
}

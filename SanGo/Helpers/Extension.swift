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

extension View {
    func enableBorder(with radius: CGFloat = 12) -> some View {
        self
            .padding(12)
            .background(Color.white)
            .cornerRadius(radius)
            .shadow(color: .black.opacity(0.1), radius: 6)
            .overlay(RoundedRectangle(cornerRadius: radius)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
}

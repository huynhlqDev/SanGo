//
//  PrimaryButton.swift
//  SanGo
//
//  Created by huynh on 2/7/25.
//

import SwiftUI

struct PrimaryButton: View {
    var size: ButtonSize = .medium
    var title: String
    var disabled: Bool = true
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.callout).bold()
                .shadow(color: .black.opacity(0.2), radius: 2)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: size.height)
                .padding(10)
                .background(Color.sanGoApp01)
                .cornerRadius(16)
                .shadow(color: .sanGoApp01.opacity(0.4), radius: 6, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(.black.opacity(0.05), lineWidth: 2)
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack {
        PrimaryButton(size: .mini, title: "Mini", action: {})
        PrimaryButton(size: .medium, title: "normal", action: {})
        PrimaryButton(size: .large, title: "large", action: {})
    }
    .padding()
}

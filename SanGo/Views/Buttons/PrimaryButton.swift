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
    var disabled: Bool = false
    var action: () -> Void

    var body: some View {
        Text(title)
            .font(.callout).bold()
            .shadow(color: .black.opacity(0.2), radius: 2)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: size.height)
            .padding(10)
            .background(Color.sango2)
            .cornerRadius(22)
            .shadow(color: Color.sango2.opacity(0.5), radius: 6, x: 0, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.sango2.opacity(1), lineWidth: 1)
            )
            .onTapGesture(perform: action)
            .disabled(disabled)
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

//
//  AttentionButton.swift
//  SanGo
//
//  Created by huynh on 22/6/25.
//

import SwiftUI

struct AttentionButton: View {
    var size: ButtonSize = .large
    var title: String
    var disabled: Bool = false
    var maxWidth: CGFloat? = nil
    var action: () -> Void

    var body: some View {
        Text(title)
            .font(Font.system(size: size.fontSize)).bold()
            .foregroundStyle(.white)
            .frame(maxWidth: (maxWidth != nil) ? maxWidth : .none)
            .frame(height: size.height)
            .padding(10)
            .background(disabled ? .gray : .orange)
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.1), radius: 6)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black.opacity(0.2), lineWidth: 1)
            )
            .onTapGesture(perform: action)
            .disabled(disabled)
    }
}

#Preview {
    HStack {
        AttentionButton(size: .mini, title: "Mini", action: {})
        AttentionButton(size: .medium, title: "Normal", action: {})
        AttentionButton(size: .large, title: "Large", action: {})
    }
    .padding()
}

//
//  DangerButton.swift
//  SanGo
//
//  Created by huynh on 22/6/25.
//

import SwiftUI

struct DangerButton: View {
    var size: ButtonSize = .medium
    var title: String
    var disabled: Bool = false
    var action: () -> Void

    var body: some View {
        Text(title)
            .font(Font.system(size: size.fontSize)).bold()
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: size.height)
            .padding(10)
            .background(disabled ? .gray : .red)
            .cornerRadius(22)
            .shadow(color: .black.opacity(0.1), radius: 6)
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.black.opacity(0.3), lineWidth: 1)
            )
            .onTapGesture(perform: action)
            .disabled(disabled)
    }
}

#Preview {
    HStack {
        DangerButton(size: .mini, title: "Mini", action: {})
        DangerButton(size: .medium, title: "Normal", action: {})
        DangerButton(size: .large, title: "Large", action: {})
    }
    .padding()
}

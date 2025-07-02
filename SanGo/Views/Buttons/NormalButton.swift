//
//  NormalButton.swift
//  SanGo
//
//  Created by huynh on 22/6/25.
//

import SwiftUI

struct NormalButton: View {
    var size: ButtonSize = .large
    var title: String
    var disabled: Bool = false
    var action: () -> Void

    var body: some View {
        Text(title)
            .font(Font.system(size: size.fontSize)).bold()
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .frame(height: size.height)
            .padding(10)
            .background(.clear)
            .cornerRadius(22)
            .shadow(color: .black.opacity(0.1), radius: 6)
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.black.opacity(0.2), lineWidth: 1)
            )
            .onTapGesture(perform: action)
            .disabled(disabled)
    }
}

#Preview {
    HStack {
        NormalButton(size: .mini, title: "Mini", action: {})
        NormalButton(size: .medium, title: "normal", action: {})
        NormalButton(size: .large, title: "large", action: {})
    }
    .padding()
}

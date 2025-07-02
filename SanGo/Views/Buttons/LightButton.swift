//
//  LightButton.swift
//  SanGo
//
//  Created by huynh on 22/6/25.
//

import SwiftUI

struct LightButton: View {
    var size: ButtonSize = .large
    var title: String
    var disabled: Bool = false
    var action: () -> Void

    var body: some View {
        Text(title)
            .font(Font.system(size: size.fontSize)).bold()
            .foregroundStyle(.gray)
            .frame(maxWidth: .infinity)
            .frame(height: size.height)
            .padding(10)
            .background(.white)
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
        LightButton(size: .mini, title: "Mini", action: {})
        LightButton(size: .medium, title: "Normal", action: {})
        LightButton(size: .large, title: "Large", action: {})
    }.padding()
}

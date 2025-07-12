//
//  IconButton.swift
//  SanGo
//
//  Created by huynh on 23/6/25.
//

import SwiftUI

struct IconButton: View {
    var style: ButtonStyle = .normal
    var size: ButtonSize = .large
    var image: String
    var disabled: Bool = false
    var action: () -> Void

    var body: some View {
        Image(systemName: image)
            .resizable()
            .frame(width: size.height + 2, height: size.height + 2)
            .foregroundStyle(disabled ? style.foregroundColor.opacity(0.2) : style.foregroundColor)
            .background(.clear)
            .padding(8)
            .onTapGesture(perform: action)
            .disabled(disabled)
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.5)
        HStack {
            IconButton(style: .normal, size: .mini, image: "map", action: {})
            IconButton(style: .light, size: .medium, image: "map", action: {})
            IconButton(style: .attention, size: .large, image: "map", action: {})
            IconButton(style: .danger, size: .large, image: "map", action: {})
        }.padding(.horizontal)
    }
}

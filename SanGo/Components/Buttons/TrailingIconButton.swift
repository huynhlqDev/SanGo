//
//  TrailingIconButton.swift
//  SanGo
//
//  Created by huynh on 22/6/25.
//

import SwiftUI

struct TrailingIconButton: View {
    var style: ButtonStyle = .normal
    var size: ButtonSize = .large
    var title: String
    var image: String? = nil
    var imageSize: CGFloat? = nil
    var disabled: Bool = false
    var action: () -> Void

    var body: some View {
        HStack {
            Text(title)
                .font(Font.system(size: size.fontSize)).bold()
            if let image {
                Image(systemName: image)
                    .resizable()
                    .frame(width: imageSize ?? size.height, height:  imageSize ?? size.height)
            }
        }
        .foregroundStyle(style.foregroundColor)
        .frame(maxWidth: .infinity)
        .frame(height: size.height)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(disabled ? .gray : style.backgroundColor)
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
    VStack {
        HStack {
            TrailingIconButton(style: .normal, size: .mini, title: "Mini", image: "map", action: {})
            TrailingIconButton(style: .normal, size: .medium, title: "Normal", action: {})
            TrailingIconButton(style: .normal, size: .large, title: "Large", action: {})
        }.padding(.horizontal)
        HStack {
            TrailingIconButton(style: .light, size: .mini, title: "Mini", image: "map", action: {})
            TrailingIconButton(style: .light, size: .medium, title: "Normal", action: {})
            TrailingIconButton(style: .light, size: .large, title: "Large", action: {})
        }.padding(.horizontal)
        HStack {
            TrailingIconButton(style: .attention, size: .mini, title: "Mini", image: "map", action: {})
            TrailingIconButton(style: .attention, size: .medium, title: "Normal", action: {})
            TrailingIconButton(style: .attention, size: .large, title: "Large", action: {})
        }.padding(.horizontal)
        HStack {
            TrailingIconButton(style: .danger, size: .mini, title: "Mini", image: "map", action: {})
            TrailingIconButton(style: .danger, size: .medium, title: "Normal", action: {})
            TrailingIconButton(style: .danger, size: .large, title: "Large", action: {})
        }.padding(.horizontal)
    }
}

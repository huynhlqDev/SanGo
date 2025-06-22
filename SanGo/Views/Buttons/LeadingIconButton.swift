//
//  LeadingIconButton.swift
//  SanGo
//
//  Created by huynh on 22/6/25.
//

import SwiftUI

struct LeadingIconButton: View {
    var style: ButtonStyleEnum = .normal
    var size: ButtonSizeEnum = .large
    var title: String
    var image: String? = nil
    var disabled: Bool = false
    var action: () -> Void

    var body: some View {
        HStack {
            if let image {
                Image(systemName: image)
                    .resizable()
                    .frame(width: size.fontSize + 2, height: size.fontSize)
            }
            Text(title)
                .font(Font.system(size: size.fontSize)).bold()
        }
        .foregroundStyle(style.foregroundColor)
        .frame(maxWidth: .infinity)
        .frame(height: size.height)
        .padding(10)
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
            LeadingIconButton(style: .normal, size: .mini, title: "Mini", image: "map", action: {})
            LeadingIconButton(style: .normal, size: .normal, title: "Normal", action: {})
            LeadingIconButton(style: .normal, size: .large, title: "Large", action: {})
        }.padding(.horizontal)
        HStack {
            LeadingIconButton(style: .light, size: .mini, title: "Mini", image: "map", action: {})
            LeadingIconButton(style: .light, size: .normal, title: "Normal", action: {})
            LeadingIconButton(style: .light, size: .large, title: "Large", action: {})
        }.padding(.horizontal)
        HStack {
            LeadingIconButton(style: .attention, size: .mini, title: "Mini", image: "map", action: {})
            LeadingIconButton(style: .attention, size: .normal, title: "Normal", action: {})
            LeadingIconButton(style: .attention, size: .large, title: "Large", action: {})
        }.padding(.horizontal)
        HStack {
            LeadingIconButton(style: .danger, size: .mini, title: "Mini", image: "map", action: {})
            LeadingIconButton(style: .danger, size: .normal, title: "Normal", action: {})
            LeadingIconButton(style: .danger, size: .large, title: "Large", action: {})
        }.padding(.horizontal)
    }
}

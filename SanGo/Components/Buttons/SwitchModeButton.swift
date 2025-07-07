//
//  SwitchModeButton.swift
//  SanGo
//
//  Created by huynh on 4/7/25.
//

import SwiftUI

struct SwitchModeButton: View {
    var style: ButtonStyle = .normal
    var size: ButtonSize = .large
    var title: String
    var image: String? = nil
    var action: () -> Void

    var body: some View {
        HStack {
            if let image {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 20, height: 16)
            }
            Text(title)
                .font(Font.system(size: size.fontSize)).bold()
        }
        .foregroundStyle(.white)
        .frame(height: size.height)
        .padding(.vertical, 8).padding(.horizontal, 12)
        .background(.black)
        .cornerRadius(22)
        .shadow()
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.black.opacity(0.3), lineWidth: 1)
        )
        .onTapGesture(perform: action)
    }
}

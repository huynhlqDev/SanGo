//
//  SettingButton.swift
//  SanGo
//
//  Created by huynh on 15/6/25.
//

import SwiftUI

struct SettingButton: View {
    var title: String
    var image: String
    var frame: CGSize = CGSize(width: 22, height: 22)
    var action: () -> Void

    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .frame(width: frame.width, height: frame.height)
            Text(title)
                .font(.callout)
        }
        .padding(12)
        .onTapGesture(perform: action)
    }
}

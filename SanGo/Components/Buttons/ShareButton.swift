//
//  ShareButton.swift
//  SanGo
//
//  Created by huynh on 4/7/25.
//

import SwiftUI

struct ShareButton: View {
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            ZStack(alignment: .center) {
                Image(systemName: "arrowshape.turn.up.right.fill")
                    .resizable()
                    .foregroundColor(Color.favorite_bg_inside)
                Image(systemName: "arrowshape.turn.up.right")
                    .resizable()
                    .foregroundColor(Color.favorite_fg)
            }
        }
        .frame(width: 22, height: 20)
        .padding(12)
        .background(Color.favorite_bg_outside)
        .cornerRadius(22)
        .buttonStyle(.plain)
    }
}

#Preview {
    ShareButton()
}

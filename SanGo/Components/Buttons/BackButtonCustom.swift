//
//  BackButtonCustom.swift
//  SanGo
//
//  Created by huynh on 4/7/25.
//

import SwiftUI

struct BackButtonCustom: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "arrow.left")
                .font(.title3)
                .foregroundColor(.white)
                .shadow(radius: 4)
        }
    }
}

#Preview {
    BackButtonCustom()
}

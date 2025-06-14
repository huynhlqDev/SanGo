//
//  TimeTag.swift
//  SanGo
//
//  Created by huynh on 14/6/25.
//


import SwiftUI

struct TimeTag: View {
    var label: String
    var isReady: Bool = true

    var body: some View {
        Text(label)
            .padding(4)
            .font(.headline)
            .foregroundStyle(isReady ? .green : .red)
            .background(isReady ? .green.opacity(0.1) : .red.opacity(0.1))
            .cornerRadius(4)

    }
}

#Preview {
    HStack {
        TimeTag(label: "15h-16h", isReady: true)
        TimeTag(label: "15h-16h", isReady: false)
    }
}

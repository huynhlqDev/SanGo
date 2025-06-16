//
//  SwitchButton.swift
//  SanGo
//
//  Created by huynh on 16/6/25.
//

import SwiftUI

struct SwitchButton: View {
    var titleLeading: String
    var titleTrailing: String
    @Binding var isLeadingOn: Bool
    @Namespace private var underlineNamespace

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack (spacing: 0) {
                Text(titleLeading)
                    .foregroundStyle(isLeadingOn ? .orange : .black)
                    .font(.subheadline)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                Rectangle()
                    .fill(isLeadingOn ? Color.orange : .clear)
                    .frame(height: 2)
                    .animation(.spring(duration: 0.2), value: isLeadingOn)
            }
            .onTapGesture {
                isLeadingOn = true
            }

            VStack(spacing: 0) {
                Text(titleTrailing)
                    .foregroundStyle(!isLeadingOn ? .orange : .black)
                    .font(.subheadline)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                Rectangle()
                    .fill(!isLeadingOn ? Color.orange : .clear)
                    .frame(height: 2)
                    .animation(.spring(duration: 0.2), value: isLeadingOn)
            }
            .onTapGesture {
                isLeadingOn = false
            }
        }
        .frame(maxWidth: .infinity)
    }
}

//#Preview {
//    SwitchButton()
//}

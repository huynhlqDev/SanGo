//
//  FieldSlidingTabsView.swift
//  SanGo
//
//  Created by huynh on 5/7/25.
//

import SwiftUI

struct FieldSlidingTabsView: View {
    var tabs: [String]
    @Binding var selectedIndex: Int
    @Namespace private var underlineNamespace

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(tabs.indices, id: \.self) { index in
                    Button {
                        withAnimation {
                            if index == selectedIndex { return }
                            selectedIndex = index
                        }
                    } label: {
                        VStack(spacing: 0) {
                            Text(tabs[index])
                                .textCase(.uppercase)
                                .font(.caption).bold()
                                .foregroundColor(selectedIndex == index ? Color(hex: "##C7514F") : .black)
                                .padding(.vertical, 8)
                            // underline
                            ZStack {
                                if selectedIndex == index {
                                    Capsule()
                                        .fill(Color(hex: "##C7514F"))
                                        .matchedGeometryEffect(
                                            id: "underline",
                                            in: underlineNamespace
                                        )
                                        .frame(height: 3)
                                } else {
                                    Color.clear.frame(height: 3)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }.padding(.horizontal, 16)
        }
    }
}

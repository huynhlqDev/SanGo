//
//  MyFieldsView.swift
//  SanGo
//
//  Created by huynh on 11/6/25.
//

import SwiftUI

struct MyFieldsView: View {

    @State private var displayMode: Bool = true
    var body: some View {

        NavigationStack() {
            VStack {
                SwitchButton(
                    titleLeading: "Đã đặt",
                    titleTrailing: "Yêu thich",
                    isLeadingOn: $displayMode
                )
                VStack {
                    if displayMode {
                        Text("Danh sách sân đã đặt")
                    } else {
                        Text("Danh sách sân yêu thích")
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationTitle(title: "Quản lý sân", mode: .inline)
            .toolbarBackground(with: Color.color1, for: .navigationBar)
            .toolbarBackground(with: Color.color1, for: .tabBar)
        }
    }
}

//#Preview {
//    MyFieldsView()
//}

//
//  MyFieldsView.swift
//  SanGo
//
//  Created by huynh on 11/6/25.
//

import SwiftUI

struct MyFieldsView: View {

    @State private var displayMode: Int = 0
    var body: some View {

        NavigationStack() {
            VStack {
                Picker("Options", selection: $displayMode) {
                    Text("Đã đặt").tag(0)
                    Text("Yêu thích").tag(1)
                }
                .pickerStyle(.segmented)
                .padding()

                VStack {
                    if displayMode == 0 {
                        Text("Danh sách sân đã đặt")
                    } else {
                        Text("Danh sách sân yêu thích")
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationTitle(title: "Quản lý sân", mode: .automatic)
            .toolbarBackground(with: Color.color1, for: .tabBar)
        }
    }
}

#Preview {
    MyFieldsView()
}

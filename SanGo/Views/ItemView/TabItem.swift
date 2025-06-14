//
//  TabItem.swift
//  SanGo
//
//  Created by huynh on 14/6/25.
//

import SwiftUI

struct TabItem: View {
    static let search = TabItem(label: "Tìm kiếm", image: "magnifyingglass")
    static let myField = TabItem(label: "Sân của tôi", image: "soccerball")
    static let myAccount = TabItem(label: "Tài khoản", image: "person.crop.circle")

    var label: String
    var image: String
    var body: some View {
        Label(label, systemImage: image)
    }
}

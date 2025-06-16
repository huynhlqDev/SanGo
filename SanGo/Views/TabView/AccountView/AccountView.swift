//
//  AccountView.swift
//  SanGo
//
//  Created by huynh on 11/6/25.
//

import SwiftUI

struct AccountView: View {
    var image: Image?

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.gray)
                        Text("Beeway").bold()
                            .padding(6)
                            .foregroundStyle(Color.color4)
                        Spacer()
                    }
                    .padding()

                    Divider().background(Color.gray.opacity(0.2))

                    Text("Hướng dẫn").font(.headline)
                    SettingButton(
                        title: "Câu hỏi thường gặp",
                        image: "questionmark.circle"
                    ) {
                        print("Câu hỏi thường gặp")
                    }
                    SettingButton(
                        title: "Góp ý báo lỗi",
                        image: "exclamationmark.bubble"
                    ) {
                        print("Góp ý báo lỗi")
                    }
                    SettingButton(
                        title: "Về chúng tôi",
                        image: "person.2",
                        frame: CGSize(width: 24, height: 20)
                    ) {
                        print("Về chúng tôi")
                    }

                    Divider().background(Color.gray.opacity(0.2))

                    Text("Quy định").font(.headline)
                    SettingButton(
                        title: "Điều khoảng thoản thuận",
                        image: "text.document"
                    ) {
                        print("Điều khoảng thoản thuận")
                    }
                    SettingButton(
                        title: "Chính sách bảo mật",
                        image: "checkmark.shield"
                    ) {
                        print("Chính sách bảo mật")
                    }

                    Divider().background(Color.gray.opacity(0.2))

                    Text("Quản lý tài khoản").font(.headline)
                    SettingButton(
                        title: "Yêu cầu xoá tài khoản",
                        image: "person.crop.circle.badge.xmark",
                        frame: CGSize(width: 24, height: 20)
                    ) {
                        print("Yêu cầu xoá tài khoản")
                    }
                    SettingButton(title: "Đăng xuất", image: "arrow.backward.to.line") {
                        print("Đăng xuất")
                    }

                    Divider().background(Color.gray.opacity(0.2))

                    HStack(alignment: .center) {
                        Text("Phiên bản 1.0.0(2025)")
                            .frame(maxWidth: .infinity)
                            .font(.subheadline)
                            .foregroundStyle(Color.color4)
                    }
                    .padding()

                }
                .padding()
            }
        }
    }
}

#Preview {
    AccountView()
}

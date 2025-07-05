//
//  UserImageView.swift
//  SanGo
//
//  Created by huynh on 3/7/25.
//

import SwiftUI

struct UserImageView: View {
    var imageURL: URL? = nil    // Ảnh từ URL (optional)
    var size: CGFloat = 42

    var body: some View {
        Group {
            if let imageURL = imageURL {
                // Tải ảnh từ URL (iOS 15+)
                AsyncImage(url: imageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                    } else if phase.error != nil {
                        placeholder
                    } else {
                        ProgressView()
                    }
                }
            } else {
                placeholder
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 1))
        .shadow(radius: 2)
    }

    var placeholder: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .scaledToFill()
            .foregroundColor(.gray.opacity(0.4))
    }
}

#Preview {
    VStack(spacing: 16) {
        UserImageView(imageURL: URL(string: "https://i.pravatar.cc/100"))
        UserImageView()
    }
    .padding()
}

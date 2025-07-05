//
//  ImageView.swift
//  SanGo
//
//  Created by huynh on 15/6/25.
//

import SwiftUI

struct ImageView: View {
    private let template: [String] = ["BG-1","BG-2","BG-3", "BG-B1", "BG-B2", "BG-N1", "BG-N2"]
    var imageURL: URL? = nil


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
                        Image(getRandomImageName())
                            .resizable()
                    } else {
                        ProgressView()
                    }
                }
            } else {
                Image(getRandomImageName())
                    .resizable()
            }
        }
    }

    private func getRandomImageName() -> String {
        template.randomElement() ?? "BG-1"
    }
}

#Preview {
    ImageView()
        .frame(width: .infinity, height: 170)
}

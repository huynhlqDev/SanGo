//
//  ImageView.swift
//  SanGo
//
//  Created by huynh on 15/6/25.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        #if STUB
        Image("field-bg")
            .resizable()
        #else
        AsyncImage(url: URL(string: "https://cdn.dribbble.com/userupload/43477988/file/original-28711d65e2e8c47466e6e450b386d651.png?resize=2400x1800&vertical=center")) { image in
            image
                .resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
        #endif
    }
}

#Preview {
    ImageView()
}

//
//  DynamicHeaderView.swift
//  SanGo
//
//  Created by huynh on 5/7/25.
//

import SwiftUI

/*
 /// Example:

 ScrollView {
     StretchyHeaderImageView(imageName: "field_banner")

     VStack {
         // Content
     }
 }
 .coordinateSpace(name: "scroll")
 .ignoresSafeArea(edges: .top)

 */

struct DynamicHeaderView: View {
    let imageName: String
    let baseHeight: CGFloat

    init(imageName: String, baseHeight: CGFloat = 250) {
        self.imageName = imageName
        self.baseHeight = baseHeight
    }

    var body: some View {
        GeometryReader { geo in
            let offset = geo.frame(in: .named("scroll")).minY
            let height = offset > 0 ? baseHeight + offset : baseHeight

            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: height)
                .clipped()
                .offset(y: offset > 0 ? -offset : 0)
        }
        .frame(height: baseHeight)
    }
}

#Preview {
    DynamicHeaderView(imageName: "BG-1")
}

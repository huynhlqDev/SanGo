//
//  StarView.swift
//  SanGo
//
//  Created by huynh on 2/7/25.
//

import SwiftUI

struct StarView: View {
    let starValue: Int // từ 1 đến 5

    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: index <= starValue ? "star.fill" : "star")
                    .resizable()
                    .foregroundColor(index <= starValue ? .star_rating : .gray)
                    .frame(width: 12, height: 12)
            }
        }
    }
}


#Preview {
    StarView(starValue: 4)
}

//
//  FieldCard.swift
//  SanGo
//
//  Created by huynh on 12/6/25.
//

import SwiftUI

struct FieldCard: View {
    var field: FieldModel

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(field.name)
                .font(.headline)
            Text(field.address)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}

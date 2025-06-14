//
//  FieldCard.swift
//  SanGo
//
//  Created by huynh on 12/6/25.
//

import SwiftUI
import CoreLocation

struct FieldCard: View {
    var field: FieldModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(field.name)
                    .font(.headline)
                Text(field.address)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(field.availableTimeSlots, id: \.id) { slot in
                            TimeTag(label: slot.time)
                        }
                    }
                }
                .scrollClipDisabled(true)
            }
        }
    }
}

#Preview {
    FieldCard(field: FieldModel(
        name: "Chuyên việt",
        address: "123 Tiểu la, Đà Nẵng",
        location: CLLocationCoordinate2D(latitude: Double(10.7702), longitude: Double(106.6597)),
        imagesUrl: [],
        availableTimeSlots: []
    ))
}

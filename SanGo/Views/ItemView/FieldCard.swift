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
    var action: () -> Void

    var body: some View {
        VStack() {
            ImageView()
                .frame(height: 100)
                .frame(maxWidth: .infinity)

            VStack(alignment: .leading, spacing: 6) {
                Text(field.name)
                    .font(.headline)
                    .lineLimit(1)
                    .truncationMode(.tail)
                HStack {
                    VStack(alignment: .leading) {
                        Text(field.address)
                            .font(.subheadline)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .foregroundColor(.gray)
                        Text("5h30 - 22h30")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    BaseButton(style: .state(enable: true, label: "Đặt lịch"))
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        .onTapGesture(perform: action)
    }
}

#Preview {
    FieldCard(field: FieldModel(
        name: "Chuyên việt",
        address: "123 Tiểu la, Đà Nẵng",
        location: CLLocationCoordinate2D(latitude: Double(10.7702), longitude: Double(106.6597)),
        imagesUrl: [],
        availableTimeSlots: []
    ), action: {})
}

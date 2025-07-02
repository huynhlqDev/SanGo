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
    var starCount: Int = 4

    var body: some View {
        VStack(spacing: 10) {
            ImageView()
                .frame(height: 150)
                .frame(maxWidth: .infinity)

            HStack() {
                VStack(alignment: .leading, spacing: 2) {
                    Text(field.name)
                        .font(.headline)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    Text(field.address)
                        .font(.subheadline)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .foregroundColor(.gray)
                }
                Spacer()
            }.padding(.horizontal)

            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Thời gian")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("5h30 - 22h30")
                        .font(.caption)
                        .bold()
                        .lineLimit(1)
                        .frame(height: 16)
                }.frame(height: 44)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Đánh giá")
                        .font(.caption)
                        .foregroundColor(.gray)
                    StarView(starValue: starCount)
                }.padding(.horizontal)

                Spacer()
                PrimaryButton(title: "Đặt sân", action: {

                }).frame(width: 90)

            }.padding(.horizontal)
        }.padding(.bottom)
        .onTapGesture(perform: action)
    }
}

#Preview {
    FieldCard(field: FieldModel(
        name: "Sân vận độn Hoà xuân",
        address: "123 Tiểu la, Đà Nẵng",
        location: CLLocationCoordinate2D(latitude: Double(10.7702), longitude: Double(106.6597)),
        imagesUrl: [],
        availableTimeSlots: []
    ), action: {})
}

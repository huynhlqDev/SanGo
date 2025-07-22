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
    var starCount: Int = 4 // TODO: Implement for fill

    @State private var isFavorite: Bool = false

    var body: some View {
        VStack(spacing: 10) {
            ZStack(alignment: .top) {
                GeometryReader { gr in
                    // Field avatar
                    ImageView()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    // Favorite button
                    FavoriteButton(isSelected: $isFavorite).position(x: gr.size.width - 28, y: 24)
                }
            }
            .frame(height: 160).frame(maxWidth: .infinity)

            // Title
            HStack {
                VStack(alignment: .leading) {
                    Text(field.name)
                        .font(.headline)
                        .lineLimit(2).truncationMode(.tail)
                    Text(field.address)
                        .font(.subheadline)
                        .lineLimit(1).truncationMode(.tail)
                        .foregroundColor(.gray)
                    HStack {
                        Image(systemName: "clock.fill")
                            .font(.footnote)
                        Text("5h30 - 22h30")
                            .font(.footnote)
                            .lineLimit(1)
                    }
                }
                Spacer()
            }.padding(.horizontal)
        }
        .padding(.bottom)
    }
}

#Preview {
    FieldCard(
        field: FieldModel(
        name: "Sân vận độn Hoà xuân",
        address: "123 Tiểu la, Đà Nẵng",
        location: CLLocationCoordinate2D(latitude: Double(10.7702), longitude: Double(106.6597)),
        imagesUrl: [],
        availableTimeSlots: []
    ))
}

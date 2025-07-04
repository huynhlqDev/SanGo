//
//  FieldDetailView.swift
//  SanGo
//
//  Created by huynh on 4/7/25.
//

import SwiftUI
import Foundation

struct FieldDetailView: View {
    var field: FieldModel
    var rating: Int = 4 // TODO: Implement for fill

    @State private var isFavorite: Bool = false

    var body: some View {
        GeometryReader { gr in
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    // Image =====================================================
                    DynamicHeaderView(imageName: "BG-B1")

                    VStack(spacing: 16) {
                        // Title and location =====================================================
                        HStack() {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(field.name)
                                    .font(.title3).bold()
                                    .lineLimit(2).truncationMode(.tail)
                                Text(field.address)
                                    .font(.subheadline)
                                    .lineLimit(2).truncationMode(.tail)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }

                        // SubInformation =====================================================
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Thời gian")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text("5h30 - 22h30")
                                    .font(.caption).bold()
                                    .lineLimit(1)
                                    .frame(height: 12)
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Đánh giá")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                StarView(starValue: rating)
                            }.padding(.horizontal)

                            Spacer()

                            HStack {
                                FavoriteButton(isSelected: $isFavorite, style: .button)
                                ShareButton(action: {
                                    print("share tapped")
                                })
                            }.frame(width: 90)
                        }
                    }.padding(20)
                }
                .safeAreaInset(edge: .bottom) {
                    PrimaryButton(size: .large , title: "Đặt sân", action: {})
                        .padding(.horizontal, 20).padding(.bottom, 40)
                }
            }
            .ignoresSafeArea()
        }

        // Custom toolbar
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(.hidden, for: .navigationBar) // ✅ hide background nav bar
        .toolbar(.hidden, for: .tabBar) // 👈 hide tabbar
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButtonCustom()
            }
        }
    }
}



import CoreLocation
#Preview {
    FieldDetailView(
        field: FieldModel(
            name: "Sân vận độn Hoà xuân",
            address: "123 Tiểu la, Đà Nẵng",
            location: CLLocationCoordinate2D(latitude: Double(10.7702), longitude: Double(106.6597)),
            imagesUrl: [],
            availableTimeSlots: []
        )
    )
}

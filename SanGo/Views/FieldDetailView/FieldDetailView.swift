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

    internal enum Tab: Int {
        case detail = 0
        case services = 1
        case rating = 2

        var title: String {
            switch self {
                case .detail:
                return "Chi tiết"
            case .services:
                return "Dịch vụ"
            case .rating:
                return "Đánh giá"
            }
        }

        static func getArrayValue() -> [String] {
            [Tab.detail.title, Tab.services.title, Tab.rating.title]
        }
    }

    @State private var isFavorite: Bool = false
    @State private var selectedSlideIndex = 0
    @Namespace private var underlineNamespace

    var body: some View {
        GeometryReader { gr in
            ZStack {// BEGIN ZSTACK VIEW
                ScrollView(.vertical, showsIndicators: false) {// BEGIN SCROLL VIEW
                    // Image
                    DynamicHeaderView(imageName: "BG-B1")

                    VStack(spacing: 16) {
                        // Title and location
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

                        // SubInformation
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
                    }
                    .padding(.top, 20).padding(.horizontal, 20)

                    // SlidingView
                    FieldSlidingTabsView(tabs: Tab.getArrayValue(), selectedIndex: $selectedSlideIndex)
                        .padding(.vertical, 12)
                    Group {
                        if selectedSlideIndex == 0 {
                            Text("Chi tiết")
                        } else if selectedSlideIndex == 1 {
                            Text("Dịch vụ")

                        } else if selectedSlideIndex == 2 {
                            Text("đánh giá")

                        }
                    }

                } // END SCROLL VIEW
                .safeAreaInset(edge: .bottom) {
                    PrimaryButton(size: .large , title: "Đặt sân", action: {})
                        .padding(.horizontal, 20).padding(.bottom, 40)
                }

            } // END ZSTACK VIEW
        }
        .ignoresSafeArea()

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

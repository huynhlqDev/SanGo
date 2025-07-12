//
//  FieldDetailView.swift
//  SanGo
//
//  Created by huynh on 4/7/25.
//

import SwiftUI
import Foundation

struct FieldDetailView: View {
    // MARK: PROPERTIES
    @Environment(\.dismiss) var dismiss
    @State private var isFavorite: Bool = false
    @State private var selectedSlideIndex = 0
    @Namespace private var underlineNamespace
    @GestureState private var dragOffset = CGSize.zero
    var field: FieldModel
    var rating: Int = 4 // TODO: Implement for fill

    // MARK: ENUM
    internal enum Tab: Int {
        case detail = 0
        case openingHours = 1
        case rating = 2

        var title: String {
            switch self {
                case .detail:
                return "Chi tiết"
            case .openingHours:
                return "Dịch vụ"
            case .rating:
                return "Đánh giá"
            }
        }

        static func getArrayValue() -> [String] {
            [Tab.detail.title, Tab.openingHours.title, Tab.rating.title]
        }
    }

    // MARK: BODY
    var body: some View {
        GeometryReader { gr in
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    /// Image
                    DynamicHeaderView(imageName: "BG-B1", baseHeight: gr.size.height/5)
                    VStack(spacing: 16) {
                        /// Title and location
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

                        /// SubInformation
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
                    .padding(.horizontal, 20)

                    /// Sliding Tab view
                    FieldSlidingTabsView(
                        tabs: Tab.getArrayValue(),
                        selectedIndex: $selectedSlideIndex
                    )
                    .padding(.vertical, 12)
                    Group { // TODO: add content view
                        if selectedSlideIndex == 0 {
                            VStack(spacing: 12) {
                                FeaturesAndFacilityView(
                                    type: .features,
                                    items: ["01", "02", "03", "04", "05", "06", "07"])
                                .padding(.horizontal)

                                FeaturesAndFacilityView(
                                    type: .facility,
                                    items: ["01", "02", "03", "04", "05", "06", "07"])
                                .padding(.horizontal)
                            }
                        } else if selectedSlideIndex == 1 {
                            Text("khung giờ hoạt dộng + giá tiền")

                        } else if selectedSlideIndex == 2 {
                            Text("Các bình luận đánh giá của khác hàng")
                        }
                    }
                }

                /// Booking button
                PrimaryButton(size: .large , title: "Đặt sân ngay", action: {})
                    .padding(.horizontal, 20).padding(.bottom, 40)
                    .offset(y: gr.size.height/2)


                /// Custom toolbar
                .navigationBarBackButtonHidden()
                .toolbarBackground(.hidden, for: .navigationBar)
                .toolbar(.hidden, for: .tabBar)
                .toolbar {
                    /// Back button
                    ToolbarItem(placement: .topBarLeading) {
                        HStack {
                            Color.clear.frame(width: 0, height: 0)
                            BackButtonCustom()
                        }
                    }
                }
            }
            .background(Color(hex: "#F6F6F6"))

            // Swipe back to dismiss view
            .gesture(
                DragGesture().updating($dragOffset) { value, _, _ in
                    let isLeadingStart = value.startLocation.x < 10
                    let isToRight = value.translation.width > 80
                    if isToRight && isLeadingStart {
                        dismiss()
                    }
                }
            )
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

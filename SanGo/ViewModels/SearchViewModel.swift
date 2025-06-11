//
//  SearchViewModel.swift
//  SanGo
//
//  Created by huynh on 11/6/25.
//

import Foundation
import SwiftUI
import Combine
import CoreLocation
//import FirebaseFirestore

class SearchViewModel: ObservableObject {
    // Input từ UI
    @Published var searchText: String = ""
    @Published var selectedDistrict: String?
    @Published var selectedTimeSlot: String?
    @Published var selectedType: String?
    @Published var maxPrice: Int?

    // Output
    @Published var fields: [FieldModel] = []

    private var cancellables = Set<AnyCancellable>()
//    private let db = Firestore.firestore()

    init() {
        // Tự động tìm kiếm mỗi khi có thay đổi filter
        Publishers.CombineLatest4(
            $searchText,
            $selectedDistrict,
            $selectedTimeSlot,
            $selectedType
        )
        .debounce(for: 0.3, scheduler: DispatchQueue.main)
        .sink { [weak self] _, _, _, _ in
            self?.fetchFields()
        }
        .store(in: &cancellables)
    }

    func fetchFields() {
        #if STUB
        let data = loadMockFields()
        fields = convertDataToField(data)
        #else
        //        var query: Query = db.collection("fields")
        //
        //        if !searchText.isEmpty {
        //            query = query.whereField("city", isGreaterThanOrEqualTo: searchText)
        //        }
        //
        //        if let district = selectedDistrict {
        //            query = query.whereField("district", isEqualTo: district)
        //        }
        //
        //        if let type = selectedType {
        //            query = query.whereField("type", isEqualTo: type)
        //        }
        //
        //        if let price = maxPrice {
        //            query = query.whereField("pricePerHour", isLessThanOrEqualTo: price)
        //        }
        //
        //        query.getDocuments { [weak self] snapshot, error in
        //            if let error = error {
        //                print("Error fetching fields: \(error)")
        //                return
        //            }
        //
        //            guard let documents = snapshot?.documents else { return }
        //
        //            let allFields = documents.compactMap { doc -> FootballField? in
        //                try? doc.data(as: FootballField.self)
        //            }
        //
        //            if let timeSlot = self?.selectedTimeSlot {
        //                self?.fields = allFields.filter { field in
        //                    field.availableTimeSlots.contains(timeSlot)
        //                }
        //            } else {
        //                self?.fields = allFields
        //            }
        //        }
        #endif
    }

// MARK: PRIVATE METHOD
    private func convertDataToField(_ data: [FieldEntity]) -> [FieldModel] {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm" // Giả định định dạng giờ phút
            formatter.locale = Locale(identifier: "en_US_POSIX")
            return formatter
        }()

        return data.compactMap { entity in
            guard
                let lat = Double(entity.latitude),
                let lon = Double(entity.longitude)
            else {
                return nil // Bỏ qua nếu không thể chuyển tọa độ
            }

            let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)

            let timeSlots: [TimeSlotModel] = entity.availableTimeSlots.compactMap { slot in
                guard
                    let start = dateFormatter.date(from: slot.startTime),
                    let end = dateFormatter.date(from: slot.endTime),
                    let priceInt = Int(slot.price)
                else {
                    return nil
                }

                return TimeSlotModel(startTime: start, endTime: end, price: priceInt)
            }

            return FieldModel(
                name: entity.name,
                address: entity.address,
                location: location,
                imagesUrl: entity.imageURL.map { [$0] }, // nếu là 1 ảnh, gói lại thành mảng
                availableTimeSlots: timeSlots
            )
        }
    }

    private func loadMockFields() -> [FieldEntity] {
        guard let url = Bundle.main.url(forResource: "fields_mock", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let fields = try? JSONDecoder().decode([FieldEntity].self, from: data) else {
            return []
        }
        return fields
    }


}

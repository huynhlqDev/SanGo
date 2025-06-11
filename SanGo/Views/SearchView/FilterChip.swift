//
//  FilterChip.swift
//  SanGo
//
//  Created by huynh on 12/6/25.
//

import SwiftUI
enum FilterType {
    case address
    case time
    case price
    case fieldType

    var label: String {
        switch self {
        case .address:
            return "Khu vực"
        case .time:
            return "Thời gian"
        case .price:
            return "Giá"
        case .fieldType:
            return "Kiểu sân"
        }
    }

    var options: [String] {
        switch self {
        case .address:
            return ["Da Nang", "Hue", "Hanoi", "Ho Chi Minh"]
        case .time:
            return generateTimeSlots()
        case .price:
            return ["Giá","100k - 200k", "200k - 300k", "300k - 400k", "> 400k"]
        case .fieldType:
            return ["sân 5", "sân 7"]
        }
    }

    func generateTimeSlots() -> [String] {
        var slots: [String] = []
        for hour in 5..<23 {
            let full = String(format: "%dh - %dh", hour, hour + 1)
            let half = String(format: "%dh30 - %dh30", hour, hour + 1)
            slots.append(full)
            slots.append(half)
        }
        return slots
    }
}


struct FilterChip: View {
    var filterType: FilterType
    @Binding var selection: String

    var body: some View {
        Menu {
            ForEach(filterType.options, id: \.self) { option in
                Button(option) { selection = option }
            }
        } label: {
            Text(selection.isEmpty ? filterType.options.first! : selection)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(20)
        }
    }
}

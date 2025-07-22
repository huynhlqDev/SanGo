//
//  Enum.swift
//  SanGo
//
//  Created by huynh on 23/6/25.
//
import SwiftUI

// MARK: FACILITY
enum Facility: String, CaseIterable, Identifiable {
    
    case freeParking = "01"
    case carParking = "02"
    case shower = "03"
    case toilet = "04"
    case gearRental = "05"
    case qrPayment = "06"
    case foodAndDrink = "07"

    var id: String { rawValue }

    var description: String { "\(emoji) \(label)" }

    var label: String {
        switch self {
        case .freeParking: "Bãi xe miễn phí"
        case .carParking: "Bãi đỗ ô tô"
        case .shower: "Phòng tắm"
        case .toilet: "Nhà vệ sinh"
        case .gearRental: "Thuê giày, quần áo"
        case .qrPayment: "QR thanh toán"
        case .foodAndDrink: "Phục vụ nước, đồ ăn"
        }
    }

    var emoji: String {
        switch self {
        case .freeParking: return "🅿️"
        case .carParking: return "🚗"
        case .shower: return "🚿"
        case .toilet: return "🚻"
        case .gearRental: return "👕"
        case .qrPayment: return "💳"
        case .foodAndDrink: return "🍽️"
        }
    }
}

// MARK: DisplayMode
enum DisplayMode {
    case list
    case map

    var image: String {
        switch self {
            case .list: return "map"
            case .map: return "checklist.unchecked"
        }
    }

    var switchTextButton: String {
        switch self {
        case .list: "Bản đồ"
        case .map: "Danh sách"
        }
    }
}

// MARK: ButtonStyle
enum ButtonStyle {
    case normal
    case light
    case attention
    case danger

    var backgroundColor: Color {
        switch self {
        case .normal: .clear
        case .light: .white
        case .attention: .orange
        case .danger: .red
        }
    }

    var foregroundColor: Color {
        switch self {
        case .normal: .black
        case .light: .gray
        case .attention: .white
        case .danger: .white
        }
    }
}

// MARK: ButtonSize
enum ButtonSize {
    case mini
    case medium
    case large

    var height: CGFloat {
        switch self {
        case .mini: 16
        case .medium: 24
        case .large: 28
        }
    }

    var iconSize: CGFloat {
        switch self {
        case .mini: 8
        case .medium: 16
        case .large: 28
        }
    }

    var fontSize: CGFloat {
        switch self {
        case .mini:
            return 12.0
        case .medium:
            return 14.0
        case .large:
            return 16.0
        }
    }

    var font: Font {
        switch self {
        case .mini: .footnote
        case .medium: .body
        case .large: .title3
        }
    }
}

// MARK: FilterType
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

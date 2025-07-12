//
//  MonthCalendarView.swift
//  SanGo
//
//  Created by huynh on 10/7/25.
//

import SwiftUI

struct MonthCalendarView: View {
    var monthDate: Date
    @Binding var selectedDate: Date

    private let calendar = Calendar.current
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)

    private let formatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "vi_VN")
        f.dateFormat = "d"
        return f
    }()

    private var days: [Date] {
        let range = calendar.range(of: .day, in: .month, for: monthDate)!
        let firstOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: monthDate))!
        let firstWeekday = calendar.component(.weekday, from: firstOfMonth)

        var result: [Date] = []
        let leading = (firstWeekday + 5) % 7
        result += Array(repeating: Date.distantPast, count: leading)

        for day in range {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: firstOfMonth) {
                result.append(date)
            }
        }
        return result
    }

    var body: some View {
        VStack(spacing: 16) {
            let weekdays = ["T2", "T3", "T4", "T5", "T6", "T7", "CN"]
            LazyVGrid(columns: columns) {
                ForEach(weekdays, id: \.self) { day in
                    Text(day).font(.subheadline).foregroundColor(.gray)
                }
            }

            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(days, id: \.self) { date in
                    if calendar.isDate(date, equalTo: Date.distantPast, toGranularity: .day) {
                        Color.clear.frame(height: 32)
                    } else {
                        Button {
                            selectedDate = date
                        } label: {
                            Text(formatter.string(from: date))
                                .frame(maxWidth: .infinity, minHeight: 32)
                                .background(
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(getDateFillColor(date))
                                )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            Spacer()
        }
    }

    private func getDateFillColor(_ date: Date) -> Color {
        if calendar.isDate(selectedDate, equalTo: date, toGranularity: .day) {
            return .orange.opacity(0.5)
        } else if calendar.isDate(date, equalTo: Date(), toGranularity: .day) {
            return .blue.opacity(0.2)
        } else {
            return .clear
        }
    }
}

//
//  CustomCalendarView.swift
//  SanGo
//
//  Created by huynh on 10/7/25.
//

import SwiftUI

struct CustomCalendarView: View {
    @Binding var selectedDate: Date
    @State private var currentMonthIndex: Int = 0

    private let calendar = Calendar.current
    private let months = Array(-6...6)

    private var currentMonthTitle: String {
        let baseDate = calendar.date(byAdding: .month, value: currentMonthIndex, to: Date())!
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "vi_VN")
        formatter.dateFormat = "MMMM, yyyy"
        return formatter.string(from: baseDate).capitalized
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(currentMonthTitle).font(.headline)
                Spacer()

                Button(action: {
                    withAnimation {
                        currentMonthIndex -= 1
                    }
                }) {
                    Image(systemName: "chevron.left").padding(8)
                }
                Button(action: {
                    withAnimation {
                        currentMonthIndex += 1
                    }
                }) {
                    Image(systemName: "chevron.right").padding(8)
                }
            }
            .padding(12)
            .padding(.horizontal, 24)

            HStack(spacing: 12) {
                Button("Hôm nay") {
                    selectedDate = Date()
                    currentMonthIndex = 0
                }
                .font(.subheadline)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)

                Button("Ngày mai") {
                    let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date())!
                    selectedDate = tomorrow
                    let diff = calendar.dateComponents([.month], from: Date(), to: tomorrow).month ?? 0
                    currentMonthIndex = diff
                }
                .font(.subheadline)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }
            .padding(.bottom)

            TabView(selection: $currentMonthIndex) {
                ForEach(months, id: \.self) { offset in
                    let monthDate = calendar.date(byAdding: .month, value: offset, to: Date())!
                    MonthCalendarView(
                        monthDate: monthDate,
                        selectedDate: $selectedDate
                    )
                    .tag(offset)
                    .padding(.horizontal)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct CustomCalendarView_Previews: View {

    @State var selectedDate: Date = Date()
    var body: some View {
        VStack {
            CustomCalendarView(selectedDate: $selectedDate)
        }.frame(height: 500)
    }
}

#Preview {
    CustomCalendarView_Previews()
}

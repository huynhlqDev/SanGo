//
//  TimeSlotFilterView.swift
//  SanGo
//
//  Created by huynh on 22/6/25.
//

import SwiftUI

struct TimeSlotFilterView: View {
    var dismiss: () -> Void
    @ObservedObject var searchViewModel: SearchViewModel
    @State var selection: [String] = []


    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Thời gian")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
                IconButton(style: .attention, size: .large, image: "x.circle", action: dismiss)
            }
            .padding(12)
            .background(Color.color4)
            .frame(maxWidth: .infinity)
            ScrollView {

            }
            HStack {
                NormalButton(title: "Đặt lại") {
                    //reset the value selection
                    searchViewModel.selectedTimeSlot = []
                }
                DangerButton(
                    title: "Áp dụng",
                    disabled: searchViewModel.selectedTimeSlot.isEmpty,
                    action: setSelectedTimeSlot
                )
            }
            .padding(.horizontal)
        }
    }

    private func setSelectedTimeSlot() {
        searchViewModel.selectedTimeSlot = selection
        dismiss()
    }
}

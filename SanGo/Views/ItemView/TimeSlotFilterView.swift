//
//  TimeSlotFilterView.swift
//  SanGo
//
//  Created by huynh on 22/6/25.
//

import SwiftUI

struct TimeSlotFilterView: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Thời gian")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
                Image(systemName: "x.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        isPresented = false
                    }
            }
            .padding(12)
            .foregroundStyle(.white)
            .background(Color.color4)
            .frame(maxWidth: .infinity)
            ScrollView {

            }
            HStack {
                Text("Đặt lại")
                    .font(.title3).bold()
                    .foregroundStyle(.black)
                    .background(.clear)
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .cornerRadius(22)
                    .shadow(color: .black.opacity(0.1), radius: 6)
                    .overlay(RoundedRectangle(cornerRadius: 22)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                Text("Áp dụng")
                    .font(.title3).bold()
                    .foregroundStyle(.black)
                    .background(.clear)
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .cornerRadius(22)
                    .shadow(color: .black.opacity(0.1), radius: 6)
                    .overlay(RoundedRectangle(cornerRadius: 22)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
            }
            .padding(.horizontal)
        }
        .presentationDetents([.fraction(0.9)])
        .interactiveDismissDisabled()
    }
}

#Preview {
    StatefulPreviewWrapper(true) { isPresented in
        TimeSlotFilterView(isPresented: isPresented)
    }
}

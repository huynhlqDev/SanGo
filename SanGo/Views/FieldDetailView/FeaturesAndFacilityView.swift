//
//  FeaturesView.swift
//  SanGo
//
//  Created by huynh on 6/7/25.
//

import SwiftUI

struct FeaturesAndFacilityView: View {
    enum TypeView {
        case features
        case facility
    }
    var type: TypeView
    var items: [String]
    @State private var didAppear: Bool = false
    @State private var leadingItems: [Facility] = []
    @State private var trailingItems: [Facility] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(getTitle()).font(.headline).bold()
            HStack {
                // Leading content
                VStack(alignment: .leading) {
                    ForEach(leadingItems.indices, id: \.self) { index in
                        getItemText(with: leadingItems[index])
                    }
                }
                Spacer()

                //Trailing content
                VStack(alignment: .leading) {
                    ForEach(trailingItems.indices, id: \.self) { index in
                        getItemText(with: trailingItems[index])
                    }

                    // Odd quantity, last item has no pair
                    if !items.count.isMultiple(of: 2) {
                        Spacer()
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16).padding(.vertical, 8)
        .background(Color(hex: "#FFFFFF"))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .gray.opacity(0.2), radius: 8, x: 0, y: 1)
        .onAppear {
            if !didAppear {
                didAppear = true
                allocateItems()
            }
        }

    }

    private func getTitle() -> String {
        switch type {
        case .features: "Đặt điểm"
        case .facility: "Tiện ích"
        }
    }

    private func getItemText(with item: Facility) -> some View {
        HStack {
            switch type {
            case .features:
                Image(systemName: "checkmark").foregroundStyle(Color.sanGoApp01)
                Text(item.label)
                    .font(.subheadline)
                    .foregroundStyle(Color(hex: "#452427"))
            case .facility:
                Text(item.description)
                    .font(.subheadline)
                    .foregroundStyle(Color(hex: "#452427"))
            }
        }.padding(2)
    }

    private func allocateItems() {
        leadingItems = items.enumerated()
            .filter { $0.offset % 2 == 0 }
            .map { $0.element }
            .map { Facility(rawValue: $0)!}
        trailingItems = items.enumerated()
            .filter { $0.offset % 2 != 0 }
            .map { $0.element }
            .map { Facility(rawValue: $0)!}
    }
}

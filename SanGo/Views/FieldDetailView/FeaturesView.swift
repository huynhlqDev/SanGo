//
//  FeaturesView.swift
//  SanGo
//
//  Created by huynh on 6/7/25.
//

import SwiftUI

struct FeaturesView: View {
    var title: String
    var items: [String]
    @State private var leadingItems: [String] = []
    @State private var trailingItems: [String] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title).font(.headline).bold()
            HStack {
                // Leading content
                VStack(alignment: .leading) {
                    ForEach(leadingItems.indices, id: \.self) { index in
                        getItemText(text: leadingItems[index])
                    }
                }
                Spacer()

                //Trailing content
                VStack(alignment: .leading) {
                    ForEach(trailingItems.indices, id: \.self) { index in
                        getItemText(text: trailingItems[index])
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
        .onAppear(perform: allocateItems)
    }

    private func getItemText(text: String) -> some View {
        HStack {
            Image(systemName: "checkmark").foregroundStyle(Color.booking_button)
            Text(text).font(.subheadline).foregroundStyle(Color(hex: "#452427"))
        }.padding(2)
    }

    private func allocateItems() {
        leadingItems = items.enumerated()
            .filter { $0.offset % 2 == 0 }
            .map { $0.element }
        trailingItems = items.enumerated()
            .filter { $0.offset % 2 != 0 }
            .map { $0.element }
    }
}

#Preview {
    FeaturesView(title: "", items: ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"])
}

//
//  FilterChip.swift
//  SanGo
//
//  Created by huynh on 12/6/25.
//

import SwiftUI

struct FilterChip: View {

    // MARK: PROPERTIES
    var filterType: FilterType
    @Binding var selection: String

    // MARK: VIEW
    var body: some View {
        Menu {
            ForEach(filterType.options, id: \.self) { option in
                Button(option) { selection = option }
            }
        } label: {
//            BaseButton(style: .filter(image: nil), label: selection.isEmpty ? filterType.options.first! : selection)
        }
    }
}

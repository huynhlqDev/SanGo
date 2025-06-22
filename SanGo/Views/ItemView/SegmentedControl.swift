//
//  SegmentedControl.swift
//  SanGo
//
//  Created by huynh on 18/6/25.
//

import SwiftUI

struct SegmentedControl: View {
    var options: [String] = []
    @State private var selectedSegment = 0

    var body: some View {
        VStack {
            Picker("Options", selection: $selectedSegment) {
                ForEach(options.indices, id: \.self) { index in
                    Text(options[index]).tag(index)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

#Preview {
    SegmentedControl()
}

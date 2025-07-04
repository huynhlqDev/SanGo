//
//  SearchListView.swift
//  SanGo
//
//  Created by huynh on 15/6/25.
//

import SwiftUI
import CoreLocation

struct SearchListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State private var path = NavigationPath()

    private let fieldDetailLinkKey: String = "field_detail_link"

    var body: some View {
        VStack {
            SearchControlView(viewModel: viewModel)

            NavigationStack(path: $path) {

                List(viewModel.fields) { field in
                    VStack (spacing: 0) {
                        FieldCard(field: field, action: {
                            path.append(field.id.uuidString) // Biding data for target view
                        })

                        Color.gray.opacity(0.1).frame(height: 4)
                            .padding(.horizontal, -8)
                    }
                    .padding(.horizontal, 8)
                    .padding(.bottom, 8)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())

                }
                .listStyle(.plain)
                .task {
                    viewModel.fetchFields()
                }

                // Target view
                .navigationDestination(for: String.self) { id in
                    FieldDetailView(field: FieldModel(
                        name: "Sân vận độn Hoà xuân",
                        address: "123 Tiểu la, Đà Nẵng",
                        location: CLLocationCoordinate2D(latitude: Double(10.7702), longitude: Double(106.6597)),
                        imagesUrl: [],
                        availableTimeSlots: []
                    ))
                }
            }
        }
    }
}

#Preview {
    SearchListView(viewModel: SearchViewModel())
}

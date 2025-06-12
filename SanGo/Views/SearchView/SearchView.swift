//
//  SearchView.swift
//  SanGo
//
//  Created by huynh on 11/6/25.
//

import SwiftUI
import MapKit

struct SearchView: View {
    // MARK: PROPERTIES
    @ObservedObject var viewModel: SearchViewModel

    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 10.7626, longitude: 106.6602),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )

    // MARK: View
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                if viewModel.displayMode == .list {
                    // List view
                    VStack {
                        // 🔍 Search Bar
                        TextField("Nhập quận, thành phố...", text: $viewModel.searchText)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal)

                        // 🧰 Bộ lọc
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 10) {
                                FilterChip(filterType: .address, selection: $viewModel.selectedDistrict)
                                FilterChip(filterType: .time, selection: $viewModel.selectedTimeSlot)
                                FilterChip(filterType: .fieldType, selection: $viewModel.selectedFielType)
                                FilterChip(filterType: .price, selection: $viewModel.selectedMaxPrice)
                            }
                            .padding(.horizontal)
                        }
                        .scrollClipDisabled()

                        // 📋 Danh sách sân
                        List(viewModel.fields) { field in
                            FieldCard(field: field)
                        }
                        .listStyle(.plain)
                    }
                    .task {
                        viewModel.fetchFields()
                    }
                } else {
                    // Map view
                    Map(position: $cameraPosition) {
//                        ForEach(fields) { field in
//                            Marker(field.name, coordinate: field.coordinate)
//                        }
                        UserAnnotation()
                    }
                    .mapControls {
                        MapUserLocationButton()
                        MapCompass()
                    }
                    .ignoresSafeArea(.all, edges: .all)
                    .navigationBarHidden(true)
                }
                // Change display mode button
                Button(action: {
                    viewModel.displayMode = (viewModel.displayMode == .list) ? .map : .list
                }) {
                    Text(viewModel.displayMode == .list ? "Bản đồ" : "Danh sách")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(12)
                }
            }
        }
    }

    // MARK: Private Method

}

#Preview {
    SearchView(viewModel: SearchViewModel())
}

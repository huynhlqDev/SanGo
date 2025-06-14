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
    @ObservedObject var locationManager: LocationManager
    @ObservedObject var viewModel: SearchViewModel

    @State private var cameraPosition: MapCameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 16.0471, longitude: 108.2068),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )

    // MARK: View
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                switch viewModel.displayMode {
                case .list: listView
                case .map: mapView
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

    private var mapView: some View {
        ZStack(alignment: .top) {
            Map(position: $cameraPosition) {
                UserAnnotation()
            }
            .mapControls {
                MapUserLocationButton()
                MapCompass()
            }
            .onAppear {
                locationManager.requestLocation()
            }
            // 🔍 Search Bar
            SearchBarView(provinceText: viewModel.selectedDistrict, onTapAction: {})
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarHidden(true)
    }

    private var listView: some View {
        VStack {
            // 🔍 Search Bar
            SearchBarView(provinceText: viewModel.selectedDistrict, onTapAction: {})
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
            .listStyle(.plain).task {
                viewModel.fetchFields()
            }
        }
    }

    // MARK: Private Method
    private func updateCameraPosition() {
        guard let userLocation = locationManager.userLocation else {
            return
        }
        cameraPosition = MapCameraPosition.region(
            MKCoordinateRegion(
                center: userLocation,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        )
    }

}

#Preview {
    SearchView(locationManager: LocationManager(), viewModel: SearchViewModel())
}

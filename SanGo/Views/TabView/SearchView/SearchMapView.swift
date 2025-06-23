//
//  SearchMapView.swift
//  SanGo
//
//  Created by huynh on 15/6/25.
//

import SwiftUI
import MapKit

struct SearchMapView: View {
    @ObservedObject var viewModel: SearchViewModel
    @StateObject var locationManager = LocationManager()

    @State private var cameraPosition: MapCameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 16.0471, longitude: 108.2068),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )

    var body: some View {
        ZStack(alignment: .top) {
            Map(position: $cameraPosition) {
                UserAnnotation()
            }
            .mapControls {
                MapUserLocationButton()
                MapCompass()
            }
            .onAppear(perform: locationManager.requestLocation)
            SearchControlView(viewModel: viewModel)
        }
        .navigationBarHidden(true)
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
    SearchMapView(viewModel: SearchViewModel())
}

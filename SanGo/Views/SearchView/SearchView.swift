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
                case .list:
                    VStack {
                        SearchControlView(viewModel: viewModel)
                        List(viewModel.fields) { field in
                            FieldCard(field: field)
                        }
                        .listStyle(.plain)
                        .task {
                            viewModel.fetchFields()
                        }
                    }
                case .map:
                    ZStack(alignment: .top) {
                        Map(position: $cameraPosition) {
                            UserAnnotation()
                        }
                        .mapControls {
                            MapUserLocationButton()
                            MapCompass()
                        }
                        .onAppear(perform: locationManager.requestLocation)
                        SearchControlView(viewModel: viewModel, backgroundColor: .clear)
                    }
                    .navigationBarHidden(true)
                }
                BaseButton(
                    style: .dark(image: viewModel.displayMode.image),
                    label: viewModel.displayMode.switchTextButton,
                    action: viewModel.switchDisplayMode
                )
                .padding(8)
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

//#Preview {
//    SearchView(locationManager: LocationManager(), viewModel: SearchViewModel())
//}

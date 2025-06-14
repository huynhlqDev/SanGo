//
//  LocationManager.swift
//  SanGo
//
//  Created by huynh on 13/6/25.
//
import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()

    @Published var userLocation: CLLocationCoordinate2D?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var locationError: String?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest// Dùng GPS
    }

    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()// Yêu cầu quyền vị trí
        locationManager.requestLocation()// Yêu cầu vị trí hiện tại
    }
}

extension LocationManager: CLLocationManagerDelegate {

    internal func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus

        switch authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.requestLocation()
        case .denied, .restricted:
            locationError = "Không có quyền truy cập vị trí."
        case .notDetermined:
            break
        @unknown default:
            break
        }
    }

    internal func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.first {
            userLocation = location.coordinate
        }
    }

    internal func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationError = error.localizedDescription
    }
}


//
//  FieldModel.swift
//  SanGo
//
//  Created by huynh on 11/6/25.
//
import SwiftUI
import CoreLocation

struct FieldModel: Identifiable {
    let id: UUID = UUID()
    let name: String
    let address: String
    let location: CLLocationCoordinate2D
    let imagesUrl: [String]?
    let availableTimeSlots: [TimeSlotModel]
}

struct TimeSlotModel {
    let startTime: Date
    let endTime: Date
    let price: Int
}

//
//  FieldEntity.swift
//  SanGo
//
//  Created by huynh on 11/6/25.
//
import SwiftUI

struct FieldEntity: Codable, Identifiable {
    let id: String
    let name: String
    let address: String
    let imageURL: String?
    let availableTimeSlots: [TimeSlot]
    let latitude: String
    let longitude: String
}

struct TimeSlot: Codable {
    let startTime: String
    let endTime: String
    let price: String
}

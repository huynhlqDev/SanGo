//
//  FieldResponse.swift
//  SanGo
//
//  Created by huynh on 12/7/25.
//

struct FieldsResponse: Decodable {
    let results: [Field]
}

struct Field: Identifiable, Decodable {
    var id: String { place_id }

    let name: String
    let place_id: String
    let vicinity: String?
    let rating: Double?
    let geometry: Geometry
    let photos: [Photo]?
}

struct Geometry: Decodable {
    let location: Location
}

struct Location: Decodable {
    let lat: Double
    let lng: Double
}

struct Photo: Decodable {
    let photo_reference: String
}

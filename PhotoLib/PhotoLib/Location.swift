//
//  Location.swift
//  PhotoLib
//
//  Created by Nikita Shyshkin on 22/07/2025.
//

struct Location: Codable {
    let latitude: Double
    let longitude: Double

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

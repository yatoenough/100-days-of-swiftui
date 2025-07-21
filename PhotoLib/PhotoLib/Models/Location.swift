//
//  Location.swift
//  PhotoLib
//
//  Created by Nikita Shyshkin on 22/07/2025.
//

struct Location: Codable, Hashable {
    let latitude: Double
    let longitude: Double

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

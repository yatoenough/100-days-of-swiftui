//
//  Location.swift
//  BucketList
//
//  Created by Nikita Shyshkin on 01/07/2025.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
	let id: UUID
	let name: String
	let description: String
	let latitude: Double
	let longitude: Double

	var coordinate: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
}

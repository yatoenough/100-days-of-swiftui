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
	var name: String
	var description: String
	var latitude: Double
	var longitude: Double
	
	var coordinate: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
}

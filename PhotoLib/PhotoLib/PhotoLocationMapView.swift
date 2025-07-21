//
//  PhotoLocationMapView.swift
//  PhotoLib
//
//  Created by Nikita Shyshkin on 22/07/2025.
//

import MapKit
import SwiftUI

struct PhotoLocationMapView: View {
	let name: String
	let location: Location

	var body: some View {
		Map(
			initialPosition: MapCameraPosition.region(
				MKCoordinateRegion(
					center: CLLocationCoordinate2D(
						latitude: location.latitude,
						longitude: location.longitude
					),
					span: MKCoordinateSpan(
						latitudeDelta: 0.1,
						longitudeDelta: 0.1
					)
				)
			)
		) {
			Marker(
				name,
				coordinate: CLLocationCoordinate2D(
					latitude: location.latitude,
					longitude: location.longitude
				)
			)
		}
	}
}

#Preview {
	PhotoLocationMapView(
		name: "Demo",
		location: Location(latitude: 30, longitude: 30)
	)
}

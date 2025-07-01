//
//  ContentView.swift
//  BucketList
//
//  Created by Nikita Shyshkin on 26/06/2025.
//

import MapKit
import SwiftUI

struct ContentView: View {
	@State private var locations = [Location]()

	var body: some View {
		MapReader { proxy in
			Map {
				ForEach(locations) { location in
					Marker(
						location.name,
						coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
					)
				}
			}
			.mapStyle(.hybrid)
			.onTapGesture { position in
				if let coordinate = proxy.convert(position, from: .local) {
					let newLocation = Location(
						id: UUID(),
						name: "New Location",
						description: "",
						latitude: coordinate.latitude,
						longitude: coordinate.longitude
					)
					
					locations.append(newLocation)
				}
			}
		}
	}
}

#Preview {
	ContentView()
}

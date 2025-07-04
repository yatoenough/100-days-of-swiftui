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
	@State private var selectedPlace: Location?
	
	var body: some View {
		MapReader { proxy in
			Map {
				ForEach(locations) { location in
					Annotation(location.name, coordinate: location.coordinate) {
						Image(systemName: "star.circle")
							.resizable()
							.foregroundStyle(.red)
							.frame(width: 44, height: 44)
							.background(.white)
							.clipShape(.circle)
							.onLongPressGesture(minimumDuration: 0.2) {
								selectedPlace = location
							}
					}
					
				}
			}
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
			.sheet(item: $selectedPlace) { place in
				Text(place.name)
			}
		}
	}
}

#Preview {
	ContentView()
}

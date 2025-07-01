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
					Annotation(location.name, coordinate: location.coordinate) {
						Image(systemName: "star.circle")
							.resizable()
							.foregroundStyle(.red)
							.frame(width: 44, height: 44)
							.background(.white)
							.clipShape(.circle)
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
		}
	}
}

#Preview {
	ContentView()
}

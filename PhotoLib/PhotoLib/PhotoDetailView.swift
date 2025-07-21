//
//  PhotoDetailView.swift
//  PhotoLib
//
//  Created by Nikita Shyshkin on 21/07/2025.
//

import MapKit
import SwiftUI

struct PhotoDetailView: View {
	let photo: SavedPhoto

	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				Text(photo.name)
					.font(.largeTitle)
					.bold()
				Image(uiImage: UIImage(data: photo.data) ?? UIImage())
					.resizable()
					.scaledToFit()
			}
			.padding()

			if let location = photo.location {
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
					),
					interactionModes: []
				) {
					Marker(
						photo.name,
						coordinate: CLLocationCoordinate2D(
							latitude: location.latitude,
							longitude: location.longitude
						)
					)
				}
				.frame(height: 200)
				.padding()
			}
		}
	}
}

#Preview {
	PhotoDetailView(
		photo: SavedPhoto(
			id: UUID(),
			name: "Demo",
			photo: Data(),
			location: Location(latitude: 30, longitude: 30)
		)
	)
}

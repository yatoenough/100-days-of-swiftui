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
	let path: NavigationPath

	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				Text(photo.name)
					.font(.largeTitle)
					.bold()
				Image(uiImage: UIImage(data: photo.data) ?? UIImage())
					.resizable()
					.scaledToFit()
					.clipShape(RoundedRectangle(cornerRadius: 15))
			}
			.padding()

			if let location = photo.location {
				NavigationLink(value: location) {
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
					.padding()
					.frame(height: 200)
				}

			}
		}
		.navigationDestination(for: Location.self) { location in
			PhotoLocationMapView(name: photo.name, location: location)
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
		),
		path: NavigationPath()
	)
}

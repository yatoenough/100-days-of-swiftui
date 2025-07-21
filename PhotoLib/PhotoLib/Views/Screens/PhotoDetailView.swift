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
					PhotoLocationMapView(name: photo.name, location: location)
						.padding()
						.frame(height: 200)
				}
			}
		}
		.navigationDestination(for: Location.self) { location in
			PhotoLocationMapView(
				name: photo.name,
				location: location,
				interactive: true
			)
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

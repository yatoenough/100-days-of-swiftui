//
//  EditView.swift
//  BucketList
//
//  Created by Nikita Shyshkin on 04/07/2025.
//

import SwiftUI

struct EditView: View {
	enum LoadingState {
		case loading, loaded, failed
	}

	@Environment(\.dismiss) private var dismiss

	let location: Location

	@State private var name: String
	@State private var description: String
	var onSave: (Location) -> Void

	@State private var loadingState = LoadingState.loading
	@State private var pages = [Page]()

	init(location: Location, onSave: @escaping (Location) -> Void) {
		self.location = location
		self.onSave = onSave

		_name = State(initialValue: location.name)
		_description = State(initialValue: location.description)
	}

	var body: some View {
		NavigationStack {
			Form {
				Section {
					TextField("Place name", text: $name)
					TextField("Description", text: $description)
				}
				
				Section("Nearby...") {
					switch loadingState {
					case .loading:
						VStack(alignment: .center) {
							ProgressView()
								.progressViewStyle(
									CircularProgressViewStyle()
								)
						}
						.frame(maxWidth: .infinity)
					case .loaded:
						ForEach(pages, id: \.pageid) { page in
							Text(page.title)
								.font(.headline)
								+ Text(": ")
								+ Text("Page description here")
								.italic()
						}
					case .failed:
						Text("Failed to load nearby places...")
					}
				}

			}
			.navigationTitle("Place details")
			.toolbar {
				Button("Save") {
					var newLocation = location
					newLocation.name = name
					newLocation.description = description

					onSave(newLocation)
					dismiss()
				}
			}
			.task {
				await fetchNearbyPlaces()
			}
		}
	}

	func fetchNearbyPlaces() async {
		let urlString =
			"https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"

		guard let url = URL(string: urlString) else {
			print("Bad URL: \(urlString)")
			return
		}

		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			let items = try JSONDecoder().decode(Result.self, from: data)
			pages = items.query.pages.values.sorted { $0.title < $1.title }
			withAnimation {
				loadingState = .loaded
			}
		} catch {
			loadingState = .failed
		}

	}
}

#Preview {
	EditView(
		location: Location(
			id: UUID(),
			name: "Demo",
			description: "Demo",
			latitude: 50,
			longitude: 3
		)
	) { _ in

	}
}

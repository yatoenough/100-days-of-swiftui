//
//  ContentView.swift
//  BucketList
//
//  Created by Nikita Shyshkin on 26/06/2025.
//

import MapKit
import SwiftUI

struct ContentView: View {
	@State private var viewModel = ViewModel()
	@State private var mapHybridStyle = false

	var body: some View {
		if viewModel.isUnlocked {
			MapReader { proxy in
				ZStack {
					Map {
						ForEach(viewModel.locations) { location in
							Annotation(
								location.name,
								coordinate: location.coordinate
							) {
								Image(systemName: "star.circle")
									.resizable()
									.foregroundStyle(.red)
									.frame(width: 44, height: 44)
									.background(.white)
									.clipShape(.circle)
									.onLongPressGesture(minimumDuration: 0.2) {
										viewModel.selectedPlace = location
									}
							}

						}

					}
					.mapStyle(mapHybridStyle ? .hybrid : .standard)
					.onTapGesture { position in
						if let coordinate = proxy.convert(
							position,
							from: .local
						) {
							viewModel.addLocation(at: coordinate)
						}
					}
					.sheet(item: $viewModel.selectedPlace) { place in
						EditView(location: place) {
							viewModel.update(location: $0)
						}
					}
					VStack(alignment: .trailing) {
						Spacer()
						HStack {
							Spacer()
							
							Button {
								mapHybridStyle.toggle()
							} label: {
								Image(systemName: "map.circle.fill")
							}
							.padding()
							.background(.blue.gradient)
							.foregroundStyle(.white)
							.clipShape(.capsule)
						}
					}
					.padding()

				}
			}
		} else {
			Button("Unlock App", action: viewModel.authenticate)
				.padding()
				.background(.blue.gradient)
				.foregroundStyle(.white)
				.clipShape(.capsule)
				.alert("Auth failed", isPresented: $viewModel.errorAlertPresented) {
					Button("OK") { }
					Button("Retry") {
						viewModel.authenticate()
					}
				}
		}
	}
}

#Preview {
	ContentView()
}

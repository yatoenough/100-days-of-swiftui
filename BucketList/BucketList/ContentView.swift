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
	
	var body: some View {
		if viewModel.isUnlocked {
			MapReader { proxy in
				Map {
					ForEach(viewModel.locations) { location in
						Annotation(location.name, coordinate: location.coordinate) {
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
				.onTapGesture { position in
					if let coordinate = proxy.convert(position, from: .local) {
						viewModel.addLocation(at: coordinate)
					}
				}
				.sheet(item: $viewModel.selectedPlace) { place in
					EditView(location: place) {
						viewModel.update(location: $0)
					}
				}
			}
		} else {
			Button("Unlock App", action: viewModel.authenticate)
				.padding()
				.background(.blue.gradient)
				.foregroundStyle(.white)
				.clipShape(.capsule)
		}
	}
}

#Preview {
	ContentView()
}

//
//  ContentView.swift
//  PhotoLib
//
//  Created by Nikita Shyshkin on 20/07/2025.
//

import PhotosUI
import SwiftData
import SwiftUI

struct ContentView: View {
	@Query var savedImages: [SavedPhoto]
	
	@Environment(PhotosViewModel.self) private var photosViewModel
	
	var body: some View {
		NavigationStack {
			List(savedImages) { image in
				HStack {
					photosViewModel.loadImage(data: image.data)
						.resizable()
						.frame(width: 50, height: 50)
						.scaledToFill()
					Spacer()
					Text("\(image.name)")
				}
				.frame(maxWidth: .infinity, maxHeight: 200)
			}
		}
	}
}

#Preview {
	ContentView()
		.modelContainer(for: SavedPhoto.self, inMemory: true)
		.environment(PhotosViewModel())
}

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
	@State private var selectedImage: PhotosPickerItem?
	@State private var loadedImage: UIImage?
	
	@Environment(\.modelContext) var modelContext
	
	@Query var savedImages: [SavedImage]
	
	var body: some View {
		NavigationStack {
			List(savedImages) { image in
				HStack {
					Image(uiImage: loadImage(data: image.imageData))
						.resizable()
						.frame(width: 50, height: 50)
						.scaledToFill()
					Spacer()
					Text("\(image.name)")
				}
				.frame(maxWidth: .infinity, maxHeight: 200)
			}
			.toolbar {
				PhotosPicker("Pick an image", selection: $selectedImage)
			}
			.onChange(of: selectedImage, importImage)
		}
	}

	func importImage() {
		Task {
			guard let imageData = try await selectedImage?.loadTransferable(type: Data.self) else {
				return
			}
			
			let newImage = SavedImage(id: UUID(), name: "name", photo: imageData)
			
			modelContext.insert(newImage)
		}
	}
	
	func loadImage(data: Data) -> UIImage {
		guard let uiImage = UIImage(data: data) else {
			fatalError("Couldn't load image")
		}
		
		return uiImage
	}
}

#Preview {
	ContentView()
		.modelContainer(for: SavedImage.self, inMemory: true)
}

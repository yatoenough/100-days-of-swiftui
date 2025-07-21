//
//  PhotosViewModel.swift
//  PhotoLib
//
//  Created by Nikita Shyshkin on 21/07/2025.
//

import PhotosUI
import SwiftData
import SwiftUI

@Observable
class PhotosViewModel {
	private var modelContext: ModelContext

	init(modelContext: ModelContext) {
		self.modelContext = modelContext
	}

	func loadImage(data: Data) -> Image {
		guard let uiImage = UIImage(data: data) else {
			fatalError("Couldn't load image")
		}

		return Image(uiImage: uiImage)
	}

	func imageData(from image: PhotosPickerItem?) async throws -> Data {
		guard
			let imageData = try await image?.loadTransferable(
				type: Data.self
			)
		else {
			fatalError("Couldn't load image data")
		}

		return imageData
	}

	func removeImage(_ image: SavedPhoto) {
		modelContext.delete(image)
	}

}

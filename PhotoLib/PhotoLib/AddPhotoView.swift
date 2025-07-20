//
//  AddPhotoView.swift
//  PhotoLib
//
//  Created by Nikita Shyshkin on 20/07/2025.
//

import PhotosUI
import SwiftUI

struct AddPhotoView: View {
	@State private var selectedImage: PhotosPickerItem?
	@State private var loadedImage: Image?

	@State private var name = ""

	@Environment(\.modelContext) var modelContext
	@Environment(PhotosViewModel.self) private var photosViewModel

	private let cornerRadius: CGFloat = 15

	var body: some View {
		NavigationStack {
			VStack {
				PhotosPicker(selection: $selectedImage) {
					if let loadedImage {
						loadedImage
							.resizable()
							.clipShape(
								RoundedRectangle(cornerRadius: cornerRadius)
							)
					} else {
						RoundedRectangle(cornerRadius: cornerRadius)
							.strokeBorder(
								style: StrokeStyle(lineWidth: 4, dash: [10])
							)
							.overlay {
								Image(systemName: "plus")
									.bold()
									.scaleEffect(2)
							}
					}
				}
				.frame(width: 200, height: 200)

				TextField("Enter", text: $name)
					.padding(.vertical)
					.textFieldStyle(.roundedBorder)
			}
			.onChange(of: selectedImage, loadImage)
			.padding()
		}

	}

	func loadImage() {
		Task {
			let imageData = try await photosViewModel.imageData(
				from: selectedImage
			)

			loadedImage = PhotosViewModel().loadImage(data: imageData)
		}
	}

	func saveImage() {
		Task {
			let imageData = try await photosViewModel.imageData(
				from: selectedImage
			)

			let newImage = SavedPhoto(
				id: UUID(),
				name: "name",
				photo: imageData
			)

			modelContext.insert(newImage)
		}
	}
}

#Preview {
	AddPhotoView()
		.modelContainer(for: SavedPhoto.self, inMemory: true)
		.environment(PhotosViewModel())
}

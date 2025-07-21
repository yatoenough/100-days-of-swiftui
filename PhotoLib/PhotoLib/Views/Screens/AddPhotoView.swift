//
//  AddPhotoView.swift
//  PhotoLib
//
//  Created by Nikita Shyshkin on 20/07/2025.
//

import PhotosUI
import SwiftUI

struct AddPhotoView: View {
	@State private var selectedPhoto: PhotosPickerItem?
	@State private var loadedImage: Image?

	@State private var name = ""

	@Environment(\.modelContext) var modelContext
	@Environment(\.dismiss) private var dismiss
	@Environment(PhotosViewModel.self) private var photosViewModel

	private let cornerRadius: CGFloat = 15

	var body: some View {
		NavigationStack {
			VStack {
				VStack {
					PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
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
					.onAppear {
						PHPhotoLibrary.requestAuthorization { _ in }
					}
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)

				VStack {
					TextField("Add photo name", text: $name)
						.padding(.vertical)
						.textFieldStyle(.roundedBorder)
					Spacer()
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
			}
			.onChange(of: selectedPhoto, loadImage)
			.padding()
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button("Cancel", role: .cancel) {
						dismiss()
					}
				}

				ToolbarItem(placement: .confirmationAction) {
					Button("+ Add", action: saveImage)
						.disabled(name.isEmpty || selectedPhoto == nil)
				}

			}
		}

	}

	func loadImage() {
		Task {
			let imageData = try await photosViewModel.photoData(
				from: selectedPhoto
			)

			withAnimation {
				loadedImage = photosViewModel.loadImage(data: imageData)
			}
		}
	}

	func saveImage() {
		Task {
			guard let selectedPhoto else { return }
			
			let imageData = try await photosViewModel.photoData(
				from: selectedPhoto
			)
			
			let location = photosViewModel.getPhotoLocation(for: selectedPhoto)

			let newImage = SavedPhoto(
				id: UUID(),
				name: name,
				photo: imageData,
				location: location
			)

			modelContext.insert(newImage)

			dismiss()
		}
	}
}
//
//#Preview {
//	AddPhotoView()
//		.modelContainer(for: SavedPhoto.self, inMemory: true)
//		.environment(PhotosViewModel())
//}

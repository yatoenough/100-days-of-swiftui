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
	
	
	var body: some View {
		NavigationStack {
			if let loadedImage {
				Image(uiImage: loadedImage)
					.resizable()
					.scaledToFit()
			}
			
			PhotosPicker("Pick an image", selection: $selectedImage)
			Text("Hello, World!")
		}
		.onChange(of: selectedImage, loadImage)
	}

	func loadImage() {
		Task {
			guard let imageData = try await selectedImage?.loadTransferable(type: Data.self) else {
				return
			}
			loadedImage = UIImage(data: imageData)
		}
	}
}

#Preview {
	ContentView()
}

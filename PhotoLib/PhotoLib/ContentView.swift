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
	
	@State private var showAddPhotoSheet = false
	
	var body: some View {
		NavigationStack {
			List(savedImages) { image in
				HStack {
					photosViewModel.loadImage(data: image.data)
						.resizable()
						.frame(width: 50, height: 50)
						.clipShape(RoundedRectangle(cornerRadius: 15))
					Text("\(image.name)")
					Spacer()
				}
				.frame(maxWidth: .infinity, maxHeight: 200)
			}
			.toolbar {
				Button("Add new photo") {
					showAddPhotoSheet.toggle()
				}
			}
		}
		.sheet(isPresented: $showAddPhotoSheet) {
			AddPhotoView()
		}
	}
}

#Preview {
	ContentView()
		.modelContainer(for: SavedPhoto.self, inMemory: true)
		.environment(PhotosViewModel())
}

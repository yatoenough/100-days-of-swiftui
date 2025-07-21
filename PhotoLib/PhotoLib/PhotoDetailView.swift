//
//  PhotoDetailView.swift
//  PhotoLib
//
//  Created by Nikita Shyshkin on 21/07/2025.
//

import SwiftUI

struct PhotoDetailView: View {
	let photo: SavedPhoto
	
    var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				Text(photo.name)
					.font(.largeTitle)
					.bold()
				Image(uiImage: UIImage(data: photo.data) ?? UIImage())
					.resizable()
					.scaledToFit()
			}
			.padding()
		}
    }
}

#Preview {
	PhotoDetailView(photo: SavedPhoto(id: UUID(), name: "Demo", photo: Data()))
}

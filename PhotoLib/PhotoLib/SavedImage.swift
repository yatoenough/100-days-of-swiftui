//
//  SavedImage.swift
//  PhotoLib
//
//  Created by Nikita Shyshkin on 20/07/2025.
//

import Foundation
import SwiftData

@Model
class SavedImage: Identifiable {
	private(set) var id: UUID
	var name: String
	@Attribute(.externalStorage) var imageData: Data
	
	init(id: UUID, name: String, photo: Data) {
		self.id = id
		self.name = name
		self.imageData = photo
	}
}

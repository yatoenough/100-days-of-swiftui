//
//  SavedPhoto.swift
//  PhotoLib
//
//  Created by Nikita Shyshkin on 20/07/2025.
//

import Foundation
import SwiftData

@Model
class SavedPhoto: Identifiable {
	private(set) var id: UUID
	var name: String
	@Attribute(.externalStorage) var data: Data
	
	init(id: UUID, name: String, photo: Data) {
		self.id = id
		self.name = name
		self.data = photo
	}
}

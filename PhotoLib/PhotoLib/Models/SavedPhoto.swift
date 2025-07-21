//
//  SavedPhoto.swift
//  PhotoLib
//
//  Created by Nikita Shyshkin on 20/07/2025.
//

import Foundation
import SwiftData
import CoreLocation

@Model
class SavedPhoto: Identifiable {
	private(set) var id: UUID
	var name: String
	@Attribute(.externalStorage) var data: Data
	var location: Location?
	
	init(id: UUID, name: String, photo: Data, location: Location? = nil) {
		self.id = id
		self.name = name
		self.data = photo
		self.location = location
	}
}

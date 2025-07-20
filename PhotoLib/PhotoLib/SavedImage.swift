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
	
	init(id: UUID, name: String) {
		self.id = id
		self.name = name
	}
}

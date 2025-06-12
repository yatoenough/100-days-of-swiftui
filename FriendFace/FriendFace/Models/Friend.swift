//
//  Friend.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import SwiftData

@Model
class Friend {
	var id: String
	var name: String

	init(id: String, name: String) {
		self.id = id
		self.name = name
	}
	
	init(_ dto: FriendDTO) {
		self.id = dto.id
		self.name = dto.name
	}
}

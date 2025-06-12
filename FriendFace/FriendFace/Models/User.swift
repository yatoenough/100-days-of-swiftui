//
//  User.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import Foundation
import SwiftData

@Model
class User {
	var id: String
	var isActive: Bool
	var name: String
	var age: Int
	var company: String
	var email: String
	var address: String
	var about: String
	var registered: Date
	var tags: [String]
	@Relationship(deleteRule: .cascade)
	var friends: [Friend]?

	init(
		id: String,
		isActive: Bool,
		name: String,
		age: Int,
		company: String,
		email: String,
		address: String,
		about: String,
		registered: Date,
		tags: [String],
		friends: [Friend]
	) {
		self.id = id
		self.isActive = isActive
		self.name = name
		self.age = age
		self.company = company
		self.email = email
		self.address = address
		self.about = about
		self.registered = registered
		self.tags = tags
		self.friends = friends
	}
	
	init(_ dto: UserDTO) {
		self.id = dto.id
		self.isActive = dto.isActive
		self.name = dto.name
		self.age = dto.age
		self.company = dto.company
		self.email = dto.email
		self.address = dto.address
		self.about = dto.about
		self.registered = dto.registered
		self.tags = dto.tags
		self.friends = dto.friends.map(Friend.init)
	}

}

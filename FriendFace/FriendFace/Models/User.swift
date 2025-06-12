//
//  User.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import Foundation

struct User: Codable {
	let id: String
	let isActive: Bool
	let name: String
	let age: Int
	let company, email, address, about: String
	let registered: Date
	let tags: [String]
	let friends: [Friend]
}


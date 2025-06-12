//
//  UserDTO.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import Foundation

struct UserDTO: Codable {
	let id: String
	let isActive: Bool
	let name: String
	let age: Int
	let company: String
	let email: String
	let address: String
	let about: String
	let registered: Date
	let tags: [String]
	let friends: [FriendDTO]
}

//
//  Friend.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import SwiftData

@Model
class Friend: Codable {
	enum CodingKeys: String, CodingKey {
		case id
		case name
	}

	var id: String
	var name: String

	init(id: String, name: String) {
		self.id = id
		self.name = name
	}

	required init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		id = try container.decode(String.self, forKey: .id)
		name = try container.decode(String.self, forKey: .name)
	}

	func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)

		try container.encode(self.id, forKey: .id)
		try container.encode(self.name, forKey: .name)
	}
}

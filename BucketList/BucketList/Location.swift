//
//  Location.swift
//  BucketList
//
//  Created by Nikita Shyshkin on 01/07/2025.
//

import Foundation

struct Location: Identifiable {
	let id: UUID
	let name: String
	let description: String
	let latitude: Double
	let longitude: Double
}

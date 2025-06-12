//
//  UsersViewModel.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import Foundation

@Observable
class UsersViewModel {
	func fetchUsers() async -> [User] {
		let urlString = "https://www.hackingwithswift.com/samples/friendface.json"
		guard let url = URL(string: urlString) else { fatalError("Invalid URL") }

		do {
			let (data, _) = try await URLSession.shared.data(from: url)

			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .iso8601

			return try decoder.decode([User].self, from: data)
		} catch {
			fatalError(error.localizedDescription)
		}
	}
}

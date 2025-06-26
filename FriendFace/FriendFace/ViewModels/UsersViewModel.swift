//
//  UsersViewModel.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import Foundation

@Observable
class UsersViewModel {
	private(set) var users = [User]()
	
	func fetchUsers() async {
		let urlString = "https://www.hackingwithswift.com/samples/friendface.json"
		guard let url = URL(string: urlString) else { fatalError("Invalid URL") }

		do {
			let (data, _) = try await URLSession.shared.data(from: url)

			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .iso8601

			users = try decoder
				.decode([UserDTO].self, from: data)
				.map(User.init)
		} catch URLError.notConnectedToInternet {
			print("No internet connection")
		} catch {
			fatalError(error.localizedDescription)
		}
	}
	
	func getFriendsOf(user: User) -> [User] {
		var friends = [User]()
		
		guard let unwrappedFriends = user.friends else { return friends }
		
		for friend in unwrappedFriends {
			guard let friendUser = users.first(where: { $0.id == friend.id }) else { continue }
			
			friends.append(friendUser)
		}
		
		return friends
	}
}

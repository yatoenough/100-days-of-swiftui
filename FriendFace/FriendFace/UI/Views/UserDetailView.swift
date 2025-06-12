//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import SwiftUI

struct UserDetailView: View {
	let user: User
	
	@Environment(UsersViewModel.self) private var usersViewModel

	private var activityTitle: String {
		user.isActive ? "Active" : "Inactive"
	}

	private var activityIndicatorColor: Color {
		user.isActive ? .green : .gray
	}
	
	private var friendsOfUser: [User] {
		var friends = [User]()
		
		for friend in user.friends {
			guard let friendUser = usersViewModel.users.first(where: { $0.id == friend.id }) else { continue }
			
			friends.append(friendUser)
		}
		
		return friends
	}

	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 20) {
				HStack {
					Circle()
						.fill(activityIndicatorColor)
						.frame(width: 15, height: 15)
					Text(activityTitle)
				}
				.padding(.bottom)
				
				Text("About")
					.font(.title2)
					.bold()
				
				Text(user.about)
				
				Text("Friends")
					.font(.title2)
					.bold()
				
				LazyVStack {
					ForEach(friendsOfUser) { friend in
						UserItem(user: friend)
							.onTapGesture {
								print("tap")
								Router.shared.path.append(friend)
							}
							.padding(.vertical)
					}
				}
					
			}
			.padding()
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
		}
		.navigationTitle("\(user.name), \(user.age)")
		.navigationDestination(for: User.self) { user in
			UserDetailView(user: user)
		}
	}
}

#Preview {
	NavigationStack {
		UserDetailView(
			user: User(
				id: UUID().uuidString,
				isActive: false,
				name: "Alan",
				age: 19,
				company: "Apple",
				email: "alan@at.com",
				address: "Whatever Street",
				about: "I'm a developer",
				registered: .now,
				tags: ["Swift", "iOS"],
				friends: []
			)
		)
	}
	.environment(UsersViewModel())
}

//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import SwiftUI
import SwiftData

struct UserDetailView: View {
	let user: User
	
	@Query private var users: [User]
	
	@Environment(UsersViewModel.self) private var usersViewModel

	private var activityTitle: String {
		user.isActive ? "Active" : "Inactive"
	}

	private var activityIndicatorColor: Color {
		user.isActive ? .green : .gray
	}
	
	private var friendsOfUser: [User] {
		usersViewModel.getFriendsOf(user: user)
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

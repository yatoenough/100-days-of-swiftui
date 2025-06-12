//
//  ContentView.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import SwiftUI

struct ContentView: View {
	@Environment(UsersViewModel.self) private var usersViewModel

	private var users: [User] {
		usersViewModel.users
	}

	@State private var router = Router.shared

	var body: some View {
		NavigationStack(path: $router.path) {
			ScrollView {
				LazyVStack {
					ForEach(users) { user in
						UserItem(user: user)
							.onTapGesture {
								Router.shared.path.append(user)
							}
							.padding()
					}
				}
			}
			.navigationTitle("Home")
			.navigationDestination(for: User.self) { user in
				UserDetailView(user: user)
			}
			.task {
				guard users.isEmpty else { return }
				await usersViewModel.fetchUsers()
			}
		}
	}
}

#Preview {
	ContentView()
		.environment(UsersViewModel())
}

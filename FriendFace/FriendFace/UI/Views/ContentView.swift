//
//  ContentView.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import SwiftUI

struct ContentView: View {
	@Environment(UsersViewModel.self) private var usersViewModel

	@State private var users = [User]()
	
	@State private var path = NavigationPath()

	var body: some View {
		NavigationStack(path: $path) {
			ScrollView {
				LazyVStack {
					ForEach(users) { user in
						UserItem(user: user)
							.padding()
							.onTapGesture {
								path.append(user)
							}
					}
				}
			}
		}
		.navigationTitle("FriendFace")
		.navigationDestination(for: User.self) { user in
			Text(user.about)
		}
		.task {
			guard users.isEmpty else { return }
			users = await usersViewModel.fetchUsers()
		}
	}
}

#Preview {
	NavigationStack {
		ContentView()
			.environment(UsersViewModel())
	}
}

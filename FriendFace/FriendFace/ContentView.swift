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

	var body: some View {
		ScrollView {
			LazyVStack {
				ForEach(users) { user in
					Text(user.id)
				}
			}
		}
		.navigationTitle("FriendFace")
		.task {
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

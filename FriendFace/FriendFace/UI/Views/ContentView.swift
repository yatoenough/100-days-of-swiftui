//
//  ContentView.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	@Query private var users: [User]

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
		}
	}
}

#Preview {
	ContentView()
		.environment(UsersViewModel())
		.modelContainer(for: User.self)
}

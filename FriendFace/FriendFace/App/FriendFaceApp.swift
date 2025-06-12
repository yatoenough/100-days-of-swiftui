//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
	let usersViewModel = UsersViewModel()

	let modelContainer: ModelContainer

	init() {
		do {
			modelContainer = try ModelContainer(for: User.self)
		} catch {
			fatalError(error.localizedDescription)
		}
	}

	var body: some Scene {
		WindowGroup {
			ContentView()
				.task {
					await populateContainer()
				}
				.environment(usersViewModel)
				.modelContainer(modelContainer)
		}
	}

	func populateContainer() async {
		await usersViewModel.fetchUsers()

		do {
			let existingUsers = try modelContainer.mainContext.fetch(FetchDescriptor<User>())
			guard existingUsers.isEmpty else { return }
		} catch {
			print(error.localizedDescription)
		}

		for user in usersViewModel.users {
			modelContainer.mainContext.insert(user)
		}
	}
}

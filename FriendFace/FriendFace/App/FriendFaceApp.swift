//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import SwiftUI
import SwiftData

@main
struct FriendFaceApp: App {
	let usersViewModel = UsersViewModel()
	
	let modelContainer: ModelContainer
	
	init() {
		do {
			modelContainer = try ModelContainer(for: User.self)
			try modelContainer.mainContext.delete(model: User.self)
		} catch {
			fatalError(error.localizedDescription)
		}
	}
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environment(usersViewModel)
				.modelContainer(modelContainer)
				.task {
					await populateContainer()
				}
			
		}
	}
	
	func populateContainer() async {
		await usersViewModel.fetchUsers()
		
		for user in usersViewModel.users {
			modelContainer.mainContext.insert(user)
		}
	}
}

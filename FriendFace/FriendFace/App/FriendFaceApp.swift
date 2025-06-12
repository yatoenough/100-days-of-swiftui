//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import SwiftUI

@main
struct FriendFaceApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environment(UsersViewModel())
		}
	}
}

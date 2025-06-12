//
//  UserInfo.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import SwiftUI

struct UserInfo: View {
	let user: User
	
	private var activityIndicatorColor: Color {
		user.isActive ? .green : .gray
	}
	
    var body: some View {
		HStack {
			Text("\(user.name), \(user.age)")
				.font(.title)
				.bold()
			Circle()
				.frame(width: 15, height: 15)
				.foregroundColor(activityIndicatorColor)
		}
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    UserInfo(
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

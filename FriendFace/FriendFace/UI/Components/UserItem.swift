//
//  UserItem.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import SwiftUI

struct UserItem: View {
	let user: User

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				HStack {
					Text("\(user.name), \(user.age)")
						.font(.title)
						.bold()
					Circle()
						.frame(width: 15, height: 15)
						.foregroundColor(user.isActive ? .green : .gray)
				}
				Text("\(user.email)")
			}

			Spacer()
		}
		.padding()
		.background(
			RoundedRectangle(cornerRadius: 20)
				.fill(Color.white)
				.shadow(color: .gray, radius: 10, y: 10)
		)
	}
}

#Preview(traits: .sizeThatFitsLayout) {
	UserItem(user: User(
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

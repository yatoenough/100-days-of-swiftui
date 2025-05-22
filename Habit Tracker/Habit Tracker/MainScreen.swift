//
//  MainScreen.swift
//  Habit Tracker
//
//  Created by Nikita Shyshkin on 22/05/2025.
//

import SwiftUI

struct MainScreen: View {
	private let habits: [String] = [
		"Drink water",
		"Read a book",
		"Go for a walk",
		"Meditate",
		"Learn a new language"
	]
	
    var body: some View {
		List(habits, id: \.self) { habit in
            Text(habit)
        }
		.navigationTitle("Habit Tracker")
    }
}

#Preview {
	NavigationStack {
		MainScreen()
	}
}

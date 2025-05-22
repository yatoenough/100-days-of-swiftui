//
//  MainScreen.swift
//  Habit Tracker
//
//  Created by Nikita Shyshkin on 22/05/2025.
//

import SwiftUI

struct MainScreen: View {
	private let habits: [Habit] = [
		Habit(
			title: "Learn Swift",
			description: "Learn SwiftUI and UIKit",
			lastCompleted: nil
		)
	]
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				Text("Completed Today:")
					.font(.title).bold()
					.padding()
				
				ForEach(habits, id: \.self) { habit in
					HabitItem(habit: habit)
						.padding()
				}
			}
		}
		.navigationTitle("Habit Tracker")
		
	}
}

#Preview {
	NavigationStack {
		MainScreen()
	}
}

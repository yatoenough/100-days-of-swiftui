//
//  MainScreen.swift
//  Habit Tracker
//
//  Created by Nikita Shyshkin on 22/05/2025.
//

import SwiftUI

struct MainScreen: View {
	private let habitVM = HabitViewModel()
	
	private var completedHabits: [Habit] {
		habitVM.habits.filter({ habitVM.completedToday($0) })
	}
	
	private var uncompletedHabits: [Habit] {
		habitVM.habits.filter({ !habitVM.completedToday($0) })
	}
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				Text("Completed Today:")
					.font(.title).bold()
					.padding()
				
				ForEach(completedHabits, id: \.self) { habit in
					HabitItem(habit: habit, habitVM: habitVM)
						.padding()
				}
			}
			
			VStack(alignment: .leading) {
				Text("Not Completed Today:")
					.font(.title).bold()
					.padding()
				
				ForEach(uncompletedHabits, id: \.self) { habit in
					HabitItem(habit: habit, habitVM: habitVM)
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

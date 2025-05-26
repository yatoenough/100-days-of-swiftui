//
//  MainScreen.swift
//  Habit Tracker
//
//  Created by Nikita Shyshkin on 22/05/2025.
//

import SwiftUI

struct MainScreen: View {
	@State private var habitVM = HabitViewModel()
	@State private var showAddHabitSheet: Bool = false
	
	private var completedHabits: [Habit] {
		habitVM.habits.filter({ habitVM.completedToday($0) })
	}
	
	private var uncompletedHabits: [Habit] {
		habitVM.habits.filter({ !habitVM.completedToday($0) })
	}
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				HStack {
					Text("Completed Today:")
						.font(.title).bold()
						.padding()
					
					Spacer()
				}
				
				ForEach(completedHabits, id: \.id) { habit in
					HabitItem(habit: habit, habitVM: habitVM)
						.padding()
				}
			}
			
			VStack(alignment: .leading) {
				HStack {
					Text("Not Completed Today:")
						.font(.title).bold()
						.padding()
					
					Spacer()
				}
				
				ForEach(uncompletedHabits, id: \.id) { habit in
					HabitItem(habit: habit, habitVM: habitVM)
						.padding()
				}
			}
		}
		.navigationTitle("Habit Tracker")
		.toolbar {
			Button("Add +") {
				showAddHabitSheet.toggle()
			}
		}
		.sheet(isPresented: $showAddHabitSheet) {
			NavigationStack {
				AddHabitView(habitVM: habitVM)
			}
		}
	}
}

#Preview {
	NavigationStack {
		MainScreen()
	}
}

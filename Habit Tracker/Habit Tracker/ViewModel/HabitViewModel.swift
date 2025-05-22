//
//  HabitViewModel.swift
//  Habit Tracker
//
//  Created by Nikita Shyshkin on 22/05/2025.
//

import Foundation

@Observable
class HabitViewModel {
	var habits: [Habit] = [
		Habit(title: "Demo", description: "This is a demo description")
	]

	func markCompleted(_ habit: Habit) {
		let storedHabit = habits.first(where: { $0.id == habit.id })
		guard var storedHabit else { return }
		if completedToday(storedHabit) { return }
		
		storedHabit.markCompleted()
		
		habits.removeAll { $0.id == storedHabit.id }
		habits.append(storedHabit)
	}
	
	func completedToday(_ habit: Habit) -> Bool {
		guard let lastCompleted = habit.lastCompleted else { return false }
		return Calendar.current.isDateInToday(lastCompleted)
	}
}

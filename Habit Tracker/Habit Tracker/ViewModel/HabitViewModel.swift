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
		Habit(title: "Demo", description: "This is a demo description", lastCompleted: Date.now)
	]
	
	
	func completedToday(_ habit: Habit) -> Bool {
		guard let lastCompleted = habit.lastCompleted else { return false }
		return Calendar.current.isDateInToday(lastCompleted)
	}
}

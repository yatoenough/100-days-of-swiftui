//
//  HabitViewModel.swift
//  Habit Tracker
//
//  Created by Nikita Shyshkin on 22/05/2025.
//

import Foundation

@Observable
class HabitViewModel {
	private var store: [Habit] {
		didSet {
			UserDefaults.standard.set(try? JSONEncoder().encode(habits), forKey: "habits")
		}
	}
	
	var habits: [Habit] { store }
	
	init() {
		do {
			guard let data = UserDefaults.standard.data(forKey: "habits") else {
				store = []
				return
			}
			
			self.store = try! JSONDecoder().decode([Habit].self, from: data)
		}
		
	}
	
	func addHabit(_ habit: Habit) {
		store.append(habit)
	}
	
	func markCompleted(_ habit: Habit) {
		let storedHabit = store.first(where: { $0.id == habit.id })
		guard var storedHabit else { return }
		if completedToday(storedHabit) { return }
		
		storedHabit.markCompleted()
		
		store.removeAll { $0.id == storedHabit.id }
		store.append(storedHabit)
	}
	
	func completedToday(_ habit: Habit) -> Bool {
		guard let lastCompleted = habit.lastCompleted else { return false }
		return Calendar.current.isDateInToday(lastCompleted)
	}
}

//
//  Habit.swift
//  Habit Tracker
//
//  Created by Nikita Shyshkin on 22/05/2025.
//

import Foundation

struct Habit {
	let id: UUID = UUID()
	let title: String
	let description: String?
	let lastCompleted: Date?
	private var timesCompleted = 0
	
	var streak: Int { timesCompleted }
	
	mutating func markCompleted() {
		timesCompleted += 1
	}
	
}

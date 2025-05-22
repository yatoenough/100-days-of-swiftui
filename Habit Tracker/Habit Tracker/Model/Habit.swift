//
//  Habit.swift
//  Habit Tracker
//
//  Created by Nikita Shyshkin on 22/05/2025.
//

import Foundation

struct Habit: Codable, Hashable, Identifiable {
	let id: UUID
	let title: String
	let description: String?
	let lastCompleted: Date?
	private var timesCompleted = 0
	
	var streak: Int { timesCompleted }
	
	init(title: String, description: String?, lastCompleted: Date?) {
		self.id = UUID()
		self.title = title
		self.description = description
		self.lastCompleted = lastCompleted
	}
	
	mutating func markCompleted() {
		timesCompleted += 1
	}
	
}

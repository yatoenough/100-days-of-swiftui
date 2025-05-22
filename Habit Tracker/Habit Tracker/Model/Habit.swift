//
//  Habit.swift
//  Habit Tracker
//
//  Created by Nikita Shyshkin on 22/05/2025.
//

import Foundation

struct Habit: Codable, Identifiable {
	let id: UUID
	let title: String
	let description: String?
	private var _lastCompleted: Date?
	private var timesCompleted = 0
	
	var streak: Int { timesCompleted }
	var lastCompleted: Date? { _lastCompleted }
	
	init(title: String, description: String?) {
		self.id = UUID()
		self.title = title
		self.description = description
	}
	
	mutating func markCompleted() {
		timesCompleted += 1
		_lastCompleted = Date.now
	}
	
}

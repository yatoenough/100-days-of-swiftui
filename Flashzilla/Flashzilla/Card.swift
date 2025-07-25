//
//  Card.swift
//  Flashzilla
//
//  Created by Nikita Shyshkin on 25/07/2025.
//

import Foundation
import SwiftData

@Model
class Card: Identifiable {
	var id: UUID
	var prompt: String
	var answer: String
	
	init(id: UUID, prompt: String, answer: String) {
		self.id = id
		self.prompt = prompt
		self.answer = answer
	}
	
	#if DEBUG
	static let example = Card(id: UUID(), prompt: "What is Swift?", answer: "A high-level programming language.")
	#endif
}

//
//  Card.swift
//  Flashzilla
//
//  Created by Nikita Shyshkin on 25/07/2025.
//

import Foundation

struct Card: Codable {
	var prompt: String
	var answer: String
	
	#if DEBUG
	static let example = Card(prompt: "What is Swift?", answer: "A high-level programming language.")
	#endif
}

//
//  CardsViewModel.swift
//  Flashzilla
//
//  Created by Nikita Shyshkin on 25/07/2025.
//

import Foundation
import SwiftData

@Observable
class CardsViewModel {
	private var modelContext: ModelContext
	
	var cards: [Card] {
		do {
			let cards = try modelContext.fetch(FetchDescriptor<Card>())
			return cards.sorted {
				$0.createdAt < $1.createdAt
			}
		} catch {
			print(error.localizedDescription)
			return []
		}
	}
	
	init(modelContext: ModelContext) {
		self.modelContext = modelContext
	}
	
	func saveCard(_ card: Card) {
		modelContext.insert(card)
	}
	
	func removeCards(at offsets: IndexSet) {
		for offset in offsets {
			let card = cards[offset]
			modelContext.delete(card)
		}
	}
}

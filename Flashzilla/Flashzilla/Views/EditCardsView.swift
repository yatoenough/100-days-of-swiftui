//
//  EditCardsView.swift
//  Flashzilla
//
//  Created by Nikita Shyshkin on 25/07/2025.
//

import SwiftData
import SwiftUI

struct EditCardsView: View {
	@Environment(\.dismiss) var dismiss
	@Environment(\.modelContext) var modelContext
	@Environment(CardsViewModel.self) var cardsViewModel

	@State private var newPrompt = ""
	@State private var newAnswer = ""

	@Query(sort: \Card.id) private var cards: [Card]

	var body: some View {
		NavigationStack {
			List {
				Section("Add new card") {
					TextField("Prompt", text: $newPrompt)
					TextField("Answer", text: $newAnswer)
					Button("Add Card", action: addCard)
				}

				Section {
					ForEach(cards) { card in
						VStack(alignment: .leading) {
							Text(card.prompt)
								.font(.headline)

							Text(card.answer)
								.font(.headline)
						}
					}
					.onDelete(perform: cardsViewModel.removeCards)
				}
			}
			.navigationTitle("Edit Cards")
			.toolbar {
				Button("Done", action: done)
			}
		}
	}

	func addCard() {
		let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
		let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)

		guard !trimmedPrompt.isEmpty && !trimmedAnswer.isEmpty else { return }

		let card = Card(id: UUID(), prompt: newPrompt, answer: newAnswer)
		cardsViewModel.saveCard(card)

		newPrompt = ""
		newAnswer = ""
	}

	func done() {
		dismiss()
	}
}

#Preview {
	EditCardsView()
}

//
//  EditCardsView.swift
//  Flashzilla
//
//  Created by Nikita Shyshkin on 25/07/2025.
//

import SwiftUI

struct EditCardsView: View {
	@Environment(\.dismiss) var dismiss
	
	@State private var cards = [Card]()
	@State private var newPrompt = ""
	@State private var newAnswer = ""
	
    var body: some View {
		NavigationStack {
			List {
				Section("Add new card") {
					TextField("Prompt", text: $newPrompt)
					TextField("Answer", text: $newAnswer)
					Button("Add Card", action: addCard)
				}
				
				Section {
					ForEach(0..<cards.count, id: \.self) { index in
						VStack(alignment: .leading) {
							Text(cards[index].prompt)
								.font(.headline)
							
							Text(cards[index].answer)
								.font(.headline)
							
						}
					}
					.onDelete(perform: removeCards)
				}
			}
			.navigationTitle("Edit Cards")
			.toolbar {
				Button("Done", action: done)
			}
			.onAppear(perform: loadData)
		}
    }
	
	func addCard() {
		let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
		let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
		
		guard !trimmedPrompt.isEmpty && !trimmedAnswer.isEmpty else { return }
		
		let card = Card(prompt: newPrompt, answer: newAnswer)
		cards.insert(card, at: 0)
		saveData()
	}
	
	func removeCards(ad offsets: IndexSet) {
		cards.remove(atOffsets: offsets)
		saveData()
	}
	
	func done() {
		dismiss()
	}
	
	func loadData() {
		if let data = UserDefaults.standard.data(forKey: "Cards") {
			if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
				cards = decoded
			}
		}
	}
	
	func saveData() {
		if let data = try? JSONEncoder().encode(cards) {
			UserDefaults.standard.set(data, forKey: "Cards")
		}
	}
}

#Preview {
	EditCardsView()
}

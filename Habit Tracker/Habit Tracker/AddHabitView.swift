//
//  AddHabitView.swift
//  Habit Tracker
//
//  Created by Nikita Shyshkin on 26/05/2025.
//

import SwiftUI

struct AddHabitView: View {
	@State private var title: String = ""
	@State private var description: String = ""
	
	@Environment(\.dismiss) var dismiss
	
	let habitVM: HabitViewModel
	
    var body: some View {
		Form {
			Section(header: Text("Add Habit")) {
				TextField("Name", text: $title)
				TextField("Description", text: $description)
			}
		}.toolbar {
			ToolbarItem(placement: .confirmationAction) {
				Button("Add") {
					addHabit()
					dismiss()
				}
				.disabled(!validateInput())
			}
			
			ToolbarItem(placement: .cancellationAction) {
				Button("Cancel") {
					dismiss()
				}
			}
		}
    }
	
	private func addHabit() {
		let habit = Habit(title: title, description: description)
		
		guard validateInput() else { return }
		
		habitVM.habits.append(habit)
	}
	
	private func validateInput() -> Bool {
		return !title.isEmpty && title.count >= 3
	}
}

#Preview {
	NavigationStack {
		AddHabitView(habitVM: HabitViewModel())
	}
}

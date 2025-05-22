//
//  HabitItem.swift
//  Habit Tracker
//
//  Created by Nikita Shyshkin on 22/05/2025.
//

import SwiftUI

struct HabitItem: View {
	let habit: Habit
	let habitVM: HabitViewModel
	
    var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 15) {
				Text(habit.title)
					.font(.title2).bold()
				
				if let description = habit.description {
					Text(description)
						.font(.subheadline)
				}
			}
			
			Spacer()
			
			HStack {
				Circle()
					.stroke(lineWidth: 3)
					.foregroundStyle(habitVM.completedToday(habit) ? .blue : .black)
					.frame(width: 75, height: 75)
					.overlay {
						Text("🔥\(habit.streak)")
							.font(.headline)
					}
			}
		}
		.padding()
		.background(RoundedRectangle(cornerRadius: 15)
			.fill(Color(uiColor: .secondarySystemFill))
		)
    }
}

#Preview("Item with description", traits: .sizeThatFitsLayout) {
	HabitItem(habit: Habit(title: "Demo", description: "This is a demo description", lastCompleted: Date.now), habitVM: HabitViewModel())
}

#Preview("Item without description", traits: .sizeThatFitsLayout) {
	HabitItem(habit: Habit(title: "Demo", description: nil, lastCompleted: Date.now), habitVM: HabitViewModel())
}

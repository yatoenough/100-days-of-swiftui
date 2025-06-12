//
//  ContentView.swift
//  iExpense
//
//  Created by Nikita Shyshkin on 17/04/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showingAddExpense = false
	
	@Query private var expenses: [ExpenseItem]
	@Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeExpenses)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView()
            }
        }
    }
    
    private func removeExpenses(at offsets: IndexSet) {
		
		
		for offset in offsets {
			modelContext.delete(expenses[offset])
		}
    }
}

#Preview {
	ContentView()
		.modelContainer(for: ExpenseItem.self)
}

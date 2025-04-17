//
//  ContentView.swift
//  iExpense
//
//  Created by Nikita Shyshkin on 17/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeExpenses)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add expense", systemImage: "plus") {
                    showingAddExpense.toggle()
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView()
            }
        }
    }
    
    private func removeExpenses(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}

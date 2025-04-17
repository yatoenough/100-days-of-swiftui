//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Nikita Shyshkin on 17/04/2025.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable class Expenses {
    var items = [ExpenseItem]()
}

//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Nikita Shyshkin on 17/04/2025.
//

import SwiftData

@Model
class ExpenseItem {
    var name: String
	var type: String
	var amount: Double
	
	init(name: String, type: String, amount: Double) {
		self.name = name
		self.type = type
		self.amount = amount
	}
}

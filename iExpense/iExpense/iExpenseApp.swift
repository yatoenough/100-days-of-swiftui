//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Nikita Shyshkin on 17/04/2025.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
				.modelContainer(for: ExpenseItem.self)
        }
    }
}

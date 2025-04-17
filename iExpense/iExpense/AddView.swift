//
//  AddView.swift
//  iExpense
//
//  Created by Nikita Shyshkin on 17/04/2025.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    private let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Expense amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
                
            }
            .navigationTitle("Add new expense")
        }
    }
}

#Preview {
    AddView()
}

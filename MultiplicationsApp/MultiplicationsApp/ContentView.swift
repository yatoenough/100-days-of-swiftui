//
//  ContentView.swift
//  MultiplicationsApp
//
//  Created by Nikita Shyshkin on 14/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var upTo = 2
    @State private var questionsCount = 5
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.yellow, .red, .blue],
                startPoint: .bottomTrailing,
                endPoint: .topLeading
            )
            .ignoresSafeArea()
            
            StartForm(upTo: $upTo, questionsCount: $questionsCount) {
                
            }
        }
    }
}

#Preview {
    ContentView()
}

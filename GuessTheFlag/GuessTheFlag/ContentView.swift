//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Nikita Shyshkin on 08/04/2025.
//

import SwiftUI

struct ContentView: View {
    private let countries: [String] = ["Estonia", "Ireland", "Germany", "Italy", "France", "Spain", "Poland", "US", "Ukraine", "UK", "Nigeria"]
    
    private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
                
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                }
                
                ForEach(0..<3) { num in
                    Button {
                        
                    } label: {
                        Image(countries[num])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

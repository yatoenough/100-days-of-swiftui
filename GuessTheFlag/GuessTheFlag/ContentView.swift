//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Nikita Shyshkin on 08/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var countries: [String] = ["Estonia", "Ireland", "Germany", "Italy", "France", "Spain", "Poland", "US", "Ukraine", "UK", "Nigeria"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    
    @State private var rotationAmounts = [0.0, 0.0, 0.0]
    @State private var selectedFlag: Int? = nil
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { num in
                    Button {
                        withAnimation() {
                            selectedFlag = num
                            rotationAmounts[num] += 360
                        }
                        
                        flagTapped(num)
                    } label: {
                        Image(countries[num])
                            .clipShape(.capsule)
                            .shadow(radius: 5)
                            .rotation3DEffect(
                                .degrees(rotationAmounts[num]),
                                axis: (x: 0, y: 1, z: 0)
                            )
                            .opacity(selectedFlag == nil || selectedFlag == num ? 1 : 0.25)
                            .scaleEffect(selectedFlag == nil || selectedFlag == num ? 1 : 0.75)
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: nextGuess)
        } message: {
            Text("Your score is: \(score)")
        }
    }
    
    func flagTapped(_ num: Int) {
        if num == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func nextGuess() {
        withAnimation {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            rotationAmounts = [0.0, 0.0, 0.0]
            selectedFlag = nil
        }
    }
}

#Preview {
    ContentView()
}

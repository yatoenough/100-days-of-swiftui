//
//  ContentView.swift
//  RockPaperScissorsBrainChallenge
//
//  Created by Nikita Shyshkin on 09/04/2025.
//

import SwiftUI

struct ContentView: View {
    private let moves = ["rock", "paper", "scissors"]
    private let emojis: [String: String] = [
        "rock": "🪨",
        "paper": "📄",
        "scissors": "✂️"
    ]
    
    @State var win = Bool.random()
    @State private var currentMove: Int = Int.random(in: 0..<3)
    @State private var score = 0
    
    private var winningMoves: [String] {
        var result: [String] = []
        
        for move in moves {
            switch move {
            case "rock":
                result.append("paper")
            case "paper":
                result.append("scissors")
            default:
                result.append("rock")
            }
        }
        
        return result
    }
    
    private var losingMoves: [String] {
        var result: [String] = []
        
        for move in moves {
            switch move {
            case "rock":
                result.append("scissors")
            case "paper":
                result.append("rock")
            default:
                result.append("paper")
            }
        }
        
        return result
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                VStack {
                    Text("Score: \(score)")
                        .font(.headline)
                        .padding(.top)
                        .contentTransition(.numericText())
                    
                    VStack(spacing: 20) {
                        Text("\(emojis[moves[currentMove]]!)")
                            .font(.largeTitle)
                        
                        Text("\(moves[currentMove].capitalized)")
                            .font(.largeTitle)
                    }
                    .padding()
                    
                    
                    Text("\(win ? "Win" : "Lose")")
                        .font(.title2)
                        .padding(.bottom)
                        .foregroundStyle(win ? .green : .red)
                        .animation(.easeInOut, value: win)
                }
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal, 100)
                
                Spacer()
                
                HStack {
                    ForEach(moves, id: \.self) { move in
                        Button(emojis[move]!.capitalized) {
                            nextTurn(move: move)
                        }
                        .font(.largeTitle)
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                    }
                    .padding()
                }
                
                Spacer()
            }
            .foregroundStyle(.white)
        }
        .bold()
    }
    
    private func nextTurn(move: String) {
        withAnimation {
            if win {
                if move == winningMoves[currentMove] {
                    score += 1
                } else {
                    score -= 1
                }
                
            } else {
                if move == losingMoves[currentMove] {
                    score += 1
                } else {
                    score -= 1
                }
            }
            
            
            resetTurn()
        }
        
    }
    
    private func resetTurn() {
        currentMove = Int.random(in: 0..<3)
        win = Bool.random()
    }
}

#Preview {
    ContentView()
}

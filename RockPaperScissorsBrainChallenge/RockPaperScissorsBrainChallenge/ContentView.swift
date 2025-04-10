//
//  ContentView.swift
//  RockPaperScissorsBrainChallenge
//
//  Created by Nikita Shyshkin on 09/04/2025.
//

import SwiftUI

struct ContentView: View {
    let moves = ["rock", "paper", "scissors"]
    @State var win = Bool.random()
    
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
    
    @State private var currentMove: Int = Int.random(in: 0..<3)
    @State private var score = 0
    
    var body: some View {
        VStack {
            VStack {
                Text("Score: \(score)")
                Text("\(moves[currentMove].capitalized)")
                Text("\(win ? "Win" : "Lose")")
            }
            
            HStack {
                ForEach(moves, id: \.self) { move in
                    Button(move) {
                        turn(move: move)
                    }
                    
                }
                .padding()
            }
        }
    }
    
    func turn(move: String) {
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
    
    func resetTurn() {
        currentMove = Int.random(in: 0..<3)
        win = Bool.random()
    }
}

#Preview {
    ContentView()
}

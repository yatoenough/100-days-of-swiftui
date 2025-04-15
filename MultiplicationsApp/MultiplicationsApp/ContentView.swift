//
//  ContentView.swift
//  MultiplicationsApp
//
//  Created by Nikita Shyshkin on 14/04/2025.
//

import SwiftUI

var answersOnQuestions: [Int] = []

struct ContentView: View {
    @State private var upTo = 6
    @State private var questionsCount = 5
    
    @State private var gameStarted = false
    @State private var gameEnded = false
    
    @State private var currentQuestionIndex = 0
    @State private var questions: [Question] = []
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.red, .indigo, .gray],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                if gameStarted {
                    QuestionItem(
                        question: questions[currentQuestionIndex],
                        onAnswer: onAnswer
                    )
                    .transition(.scale)
                } else {
                    if gameEnded {
                        ResultView(questions: questions, onRestart: onRestart)
                            .transition(.scale)
                    } else {
                        StartForm(
                            upTo: $upTo,
                            questionsCount: $questionsCount,
                            onStart: onGameStart
                        )
                        .transition(.scale)
                    }
                }
            }
        }
    }
    
    private func onGameStart() {
        for _ in 0..<questionsCount {
            let firstNumber = Int.random(in: 2...upTo)
            let secondNumber = Int.random(in: 2...upTo)
            
            let question = Question(
                text: "\(firstNumber) x \(secondNumber)",
                answer: firstNumber*secondNumber
            )
            
            questions.append(question)
        }
        
        withAnimation {
            gameStarted = true
        }
    }
    
    private func onAnswer() {
        guard currentQuestionIndex < questions.count-1 else {
            withAnimation {
                gameStarted = false
                gameEnded = true
            }
            return
        }
        
        withAnimation {
            currentQuestionIndex += 1
        }
    }
    
    private func onRestart() {
        withAnimation {
            questions.removeAll()
            gameStarted = false
            gameEnded = false
            currentQuestionIndex = 0
            answersOnQuestions = []
        }
    }
}

#Preview {
    ContentView()
}

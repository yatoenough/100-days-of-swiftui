//
//  QuestionItem.swift
//  MultiplicationsApp
//
//  Created by Nikita Shyshkin on 15/04/2025.
//

import SwiftUI

struct QuestionItem: View {
    let question: Question
    let onAnswer: () -> Void
    
    @State private var answer: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Text("\(question.text) = ")
                .font(.largeTitle)
                .contentTransition(.numericText())
            
            HStack {
                TextField("Type answer here...", text: $answer)
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .tint(.white)
                    .keyboardType(.numberPad)
                    
                Button("Check", action: submitAnswer)
                .buttonStyle(.bordered)
                .tint(.white.opacity(0.3))
                .scaleEffect(1.5)
                .padding()
            }
            .onSubmit {
                submitAnswer()
            }
            
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 5, x: 0, y: 10)
        .foregroundColor(.white)
        .bold()
        .padding()
    }
    
    private func submitAnswer() {
        let parsedAmount = Int(answer)
        
        guard let parsedAmount else { return }
        
        if parsedAmount == question.answer {
            print("Correct!")
        } else {
            print("Wrong!")
        }
        
        withAnimation {
            answer = ""
        }
        
        onAnswer()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    QuestionItem(question: Question(text: "2 x 2", answer: 4)) {}
        .background(.black)
}

//
//  ResultView.swift
//  MultiplicationsApp
//
//  Created by Nikita Shyshkin on 15/04/2025.
//

import SwiftUI

struct ResultView: View {
    let questions: [Question]
    let onRestart: () -> Void
    
    var body: some View {
        ScrollView {
            ForEach(0..<answersOnQuestions.count) { index in
                QuestionResult(question: questions[index], answer: answersOnQuestions[index])
            }
            
            Button("Play Again", action: onRestart)
                .buttonStyle(.borderedProminent)
                .tint(.white.opacity(0.3))
                .scaleEffect(1.5)
                .padding()
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 5, x: 0, y: 10)
        .foregroundColor(.white)
        .bold()
        .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ResultView(questions: []) {}
        .background(.black)
}

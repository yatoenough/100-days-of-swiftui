//
//  ResultView.swift
//  MultiplicationsApp
//
//  Created by Nikita Shyshkin on 15/04/2025.
//

import SwiftUI

struct ResultView: View {
    let questions: [Question]
    let givenAnswers: [Int]
    let onRestart: () -> Void
    
    var body: some View {
        ScrollView {
            ForEach(0..<givenAnswers.count, id: \.self) { index in
                QuestionResult(question: questions[index], answer: givenAnswers[index])
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
    ResultView(
        questions: [
            Question(text: "2 x 2", answer: 4),
            Question(text: "2 x 2", answer: 4),
            Question(text: "2 x 2", answer: 4),
            Question(text: "2 x 2", answer: 4),
        ],
        givenAnswers: [4, 4, 3, 4],
        onRestart: {}
    ).background(.black)
}

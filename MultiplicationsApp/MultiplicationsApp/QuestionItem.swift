//
//  QuestionItem.swift
//  MultiplicationsApp
//
//  Created by Nikita Shyshkin on 15/04/2025.
//

import SwiftUI

struct QuestionItem: View {
    let question: Question
    
    var body: some View {
        VStack(spacing: 30) {
            Text("\(question.text) = ")
                .font(.largeTitle)
            
            TextField("Type answer here...", text: .constant(""))
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .tint(.white)
                .keyboardType(.numberPad)
            
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
    QuestionItem(question: Question(text: "2 x 2", answer: 4))
        .background(.black)
}

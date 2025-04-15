//
//  QuestionResult.swift
//  MultiplicationsApp
//
//  Created by Nikita Shyshkin on 15/04/2025.
//

import SwiftUI

struct QuestionResult: View {
    let question: Question
    let answer: Int
    
    var body: some View {
        HStack {
            Text("\(question.text) =")
                .font(.title3)
            
            if answer == question.answer {
                Text("\(answer)")
                    .font(.title2)
                
                Spacer()
                
                Text("Correct!")
                    .foregroundStyle(.green)
            } else {
                Text("\(answer)")
                    .foregroundStyle(.red)
                    .font(.title2)
                    .strikethrough()
                
                Text("\(question.answer)")
                    .font(.title2)
                
                Spacer()
                
                Text("Wrong!")
                    .foregroundStyle(.red)
            }
            
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .foregroundStyle(.white)
        .bold()
    }
}

#Preview {
    QuestionResult(question: Question(text: "2 x 2", answer: 4), answer: 4)
        .padding()
        .background(.black)
}

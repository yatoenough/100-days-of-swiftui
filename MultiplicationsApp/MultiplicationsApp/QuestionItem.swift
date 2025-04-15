//
//  QuestionItem.swift
//  MultiplicationsApp
//
//  Created by Nikita Shyshkin on 15/04/2025.
//

import SwiftUI

struct QuestionItem: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Question")
                .font(.largeTitle)
            
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
    QuestionItem()
    .background(.black)
}

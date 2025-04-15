//
//  StartForm.swift
//  MultiplicationsApp
//
//  Created by Nikita Shyshkin on 15/04/2025.
//

import SwiftUI

struct StartForm: View {
    @Binding var upTo: Int
    @Binding var questionsCount: Int
    
    let onStart: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Stepper("Up to \(upTo)", value: $upTo, in: 2...12)
            
            HStack {
                Text("How many questions?")
                
                Spacer()
                
                Picker("How many questions?", selection: $questionsCount) {
                    Text("5")
                        .tag(5)
                    
                    Text("10")
                        .tag(10)
                    
                    Text("20")
                        .tag(20)
                }
                .tint(.white)
                .pickerStyle(.segmented)
            }
            
            
            Button("Tap to start", action: onStart)
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
    @Previewable @State var upTo = 2
    @Previewable @State var questionsCount = 5
    
    StartForm(upTo: $upTo, questionsCount: $questionsCount) {}
    .background(.black)
}



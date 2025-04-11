//
//  ContentView.swift
//  BetterSleep
//
//  Created by Nikita Shyshkin on 11/04/2025.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                
                Text("Daily coffee intake")
                    .font(.headline)
                
                Stepper("\(coffeeAmount.formatted()) cup(s)", value: $coffeeAmount, in: 1...20)
                
                
                
            }
            .toolbar {
                Button("Calculate", action: calculateSleepDuration)
            }
            .navigationTitle("BetterSleep")
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateSleepDuration() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour) + Double(minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepDuration = wakeUp - prediction.actualSleep
            
            alertMessage = "Ideal bedtime: \(sleepDuration.formatted(date: .omitted, time: .shortened ))"
        } catch {
            alertTitle = "Error"
            alertMessage = "There was an error calculating your sleep duration. Please try again."
        }
        
        showingAlert = true
    }
}

#Preview {
    ContentView()
}

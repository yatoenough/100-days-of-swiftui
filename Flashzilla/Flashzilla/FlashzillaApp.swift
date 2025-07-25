//
//  FlashzillaApp.swift
//  Flashzilla
//
//  Created by Nikita Shyshkin on 25/07/2025.
//

import SwiftUI
import SwiftData

@main
struct FlashzillaApp: App {
	private let modelContainer = {
		do {
			let container = try ModelContainer(for: Card.self)
			return container
		} catch {
			fatalError(error.localizedDescription)
		}
	}()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.modelContainer(modelContainer)
				.environment(CardsViewModel(modelContext: modelContainer.mainContext))
        }
    }
}

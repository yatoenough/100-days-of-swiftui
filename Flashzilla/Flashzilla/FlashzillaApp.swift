//
//  FlashzillaApp.swift
//  Flashzilla
//
//  Created by Nikita Shyshkin on 25/07/2025.
//

import SwiftUI

@main
struct FlashzillaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
				.modelContainer(for: Card.self)
        }
    }
}

//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Nikita Shyshkin on 23/07/2025.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		.modelContainer(for: Prospect.self)
    }
}

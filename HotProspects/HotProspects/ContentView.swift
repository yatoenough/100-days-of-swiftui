//
//  ContentView.swift
//  HotProspects
//
//  Created by Nikita Shyshkin on 23/07/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		TabView {
			ProspectsView(filter: .none)
				.tabItem {
					Label("Everyone", systemImage: "person.3")
				}
			ProspectsView(filter: .contacted)
				.tabItem {
					Label("Contacted", systemImage: "checkmark.circle")
				}
			ProspectsView(filter: .uncontacted)
				.tabItem {
					Label("Uncontacted", systemImage: "questionmark.diamond")
				}
			MeView()
				.tabItem {
					Label("Me", systemImage: "person.crop.square")
				}
		}
    }
}

#Preview {
    ContentView()
		.modelContainer(for: Prospect.self)
}

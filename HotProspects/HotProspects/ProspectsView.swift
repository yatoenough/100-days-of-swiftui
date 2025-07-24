//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Nikita Shyshkin on 24/07/2025.
//

import SwiftUI

struct ProspectsView: View {
	enum FilterType {
		case none, contacted, uncontacted
	}
	
	let filter: FilterType
	
	private var title: String {
		switch filter {
		case .none:
			"Everyone"
		case .contacted:
			"Contacted people"
		case .uncontacted:
			"Uncontacted people"
		}
	}
	
    var body: some View {
		NavigationStack {
			Text("Hello, World!")
				.navigationTitle(title)
		}
    }
}

#Preview {
	ProspectsView(filter: .none)
}

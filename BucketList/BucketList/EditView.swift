//
//  EditView.swift
//  BucketList
//
//  Created by Nikita Shyshkin on 04/07/2025.
//

import SwiftUI

struct EditView: View {
	@Environment(\.dismiss) private var dismiss
	
	let location: Location
	
	@State private var name: String
	@State private var description: String
	var onSave: (Location) -> Void
	
	init(location: Location, onSave: @escaping (Location) -> Void) {
		self.location = location
		self.onSave = onSave
		
		_name = State(initialValue: location.name)
		_description = State(initialValue: location.description)
	}
	
    var body: some View {
		NavigationStack {
			Form {
				Section {
					TextField("Place name", text: $name)
					TextField("Description", text: $description)
				}
			}
			.navigationTitle("Place details")
			.toolbar{
				Button("Save") {
					var newLocation = location
					newLocation.name = name
					newLocation.description = description
					
					onSave(newLocation)
					dismiss()
				}
			}
		}
    }
}

#Preview {
	EditView(location: Location(id: UUID(), name: "Demo", description: "Demo", latitude: 50, longitude: 3)) { _ in
		
	}
}

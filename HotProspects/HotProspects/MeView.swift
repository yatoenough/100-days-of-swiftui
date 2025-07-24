//
//  MeView.swift
//  HotProspects
//
//  Created by Nikita Shyshkin on 24/07/2025.
//

import SwiftUI

struct MeView: View {
	@AppStorage("name") private var name = "Anonymous"
	@AppStorage("email") private var email = "you@example.com"

    var body: some View {
		NavigationStack {
			Form {
				TextField("Name", text: $name)
					.textContentType(.name)
					.font(.title)
				
				TextField("Email", text: $email)
					.textContentType(.emailAddress)
					.font(.title)
			}
			.navigationTitle("Your code")
		}
    }
}

#Preview {
    MeView()
}

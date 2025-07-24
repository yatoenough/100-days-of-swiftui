//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Nikita Shyshkin on 24/07/2025.
//

import CodeScanner
import SwiftData
import SwiftUI

struct ProspectsView: View {
	enum FilterType {
		case none, contacted, uncontacted
	}

	@Environment(\.modelContext) var modelContext

	@Query(sort: \Prospect.name) var prospects: [Prospect]

	@State private var isShowingScanner = false
	@State private var selectedProspects = Set<Prospect>()

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

	init(filter: FilterType) {
		self.filter = filter

		if filter != .none {
			let showContactedOnly = filter == .contacted

			_prospects = Query(
				filter: #Predicate {
					$0.isContacted == showContactedOnly
				},
				sort: [SortDescriptor(\Prospect.name)]
			)
		}
	}

	var body: some View {
		NavigationStack {
			List(prospects, selection: $selectedProspects) { prospect in
				VStack(alignment: .leading) {
					Text(prospect.name)
						.font(.headline)

					Text(prospect.email)
						.foregroundStyle(.secondary)
				}
				.swipeActions {
					Button("Delete", systemImage: "trash", role: .destructive, action: delete)
					
					if prospect.isContacted {
						Button("Uncontact", systemImage: "person.crop.circle.badge.xmark") {
							prospect.isContacted.toggle()
						}
						.tint(.blue)
					} else {
						Button("Contact", systemImage: "person.crop.circle.fill.badge.checkmark") {
							prospect.isContacted.toggle()
						}
						.tint(.green)
					}
				}
				.tag(prospect)
			}
			.navigationTitle(title)
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button("Scan", systemImage: "qrcode.viewfinder") {
						isShowingScanner = true
					}
				}
				
				ToolbarItem(placement: .topBarLeading) {
					EditButton()
				}
				
				if selectedProspects.isEmpty == false {
					ToolbarItem(placement: .bottomBar) {
						Button("Delete Selected", action: delete)
					}
				}
			}
			.sheet(isPresented: $isShowingScanner) {
				CodeScannerView(
					codeTypes: [.qr],
					simulatedData: "Name Surname\nemail@example.com ",
					completion: handleScan
				)
			}
		}
	}

	func handleScan(result: Result<ScanResult, ScanError>) {
		isShowingScanner = false

		switch result {
		case .success(let result):
			let details = result.string.components(separatedBy: "\n")
			guard details.count == 2 else { return }
			
			let person = Prospect(name: details[0], email: details[1], isContacted: false)
			modelContext.insert(person)
			
		case .failure(let error):
			print("Scanning failed: \(error.localizedDescription)")
		}
	}
	
	func delete() {
		for prospect in selectedProspects {
			modelContext.delete(prospect)
		}
	}
}

#Preview {
	ProspectsView(filter: .none)
		.modelContainer(for: Prospect.self, inMemory: true)
}

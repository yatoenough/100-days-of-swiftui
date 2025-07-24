//
//  Prospect.swift
//  HotProspects
//
//  Created by Nikita Shyshkin on 24/07/2025.
//

import SwiftData

@Model
class Prospect {
	var name: String
	var email: String
	var isContacted: Bool
	
	init(name: String, email: String, isContacted: Bool) {
		self.name = name
		self.email = email
		self.isContacted = isContacted
	}
}

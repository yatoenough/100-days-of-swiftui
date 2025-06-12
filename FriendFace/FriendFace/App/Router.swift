//
//  Router.swift
//  FriendFace
//
//  Created by Nikita Shyshkin on 12/06/2025.
//

import SwiftUI

@Observable
class Router {
	var path = NavigationPath()

	static let shared = Router()
	
	private init() {}
}

//
//  Item.swift
//  PhotoLib
//
//  Created by Nikita Shyshkin on 20/07/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

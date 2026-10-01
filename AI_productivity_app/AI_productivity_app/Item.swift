//
//  Item.swift
//  AI_productivity_app
//
//  Created by macbook air M2 on 01/10/26.
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

//
//  Item.swift
//  SanGo
//
//  Created by huynh on 11/6/25.
//

import Foundation
import SwiftData

@Model
final class FootballField {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

//
//  Item.swift
//  WhyNotTry
//
//  Created by Luis Pablo Serrano Muñoz on 29/08/24.
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

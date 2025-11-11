//
//  JournalMood.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 13/4/25.
//

import Foundation

// Enum, struct must be codable. Prefer classes or struct
enum JournalMood: Codable {
    case low
    case lowMedium
    case medium
    case high
    case superHigh
}

import Foundation

// Enum, struct must be codable. Prefer classes or struct
public enum JournalMood: Codable {
    case low
    case lowMedium
    case medium
    case high
    case superHigh
}

import Foundation
import SwiftData

@Model
public class JournalNote {
    public var title: String
    public var descriptionNote: String
    public var mood: JournalMood
    
    public init(
        title: String,
        descriptionNote: String,
        mood: JournalMood
    ) {
        self.title = title
        self.descriptionNote = descriptionNote
        self.mood = mood
    }
}

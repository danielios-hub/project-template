//
//  JournalNote.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 13/4/25.
//

import Foundation
import SwiftData

@Model
public class JournalNote {
    //@Attribute(.unique) var emailAddress: String
    var title: String
    var descriptionNote: String
    var mood: JournalMood
    //@Transient var noteVisitCount = 0 // not stored in database, reset to 0 every rerun
    //@Attribute(.externalStorage) var avatar: Data // external storage for heavy data, like imagesç
    //@Attribute(.externalStorage, .allowsCloudEncryption) var avatar: Data // encrypted for iCloud only
    
    init(
        title: String,
        descriptionNote: String,
        mood: JournalMood
    ) {
        self.title = title
        self.descriptionNote = descriptionNote
        self.mood = mood
    }
}

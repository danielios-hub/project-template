//
//  JournalRouting.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 25/1/26.
//

import SwiftUI

public protocol JournalRouting {
    func goToEditNote(note: JournalNote)
    func goToNewNote()
    func pop()
}

// MARK: - View Factory
protocol NoteViewBuilding {
    func makeNoteEditView(note: JournalNote, router: JournalRouting) -> NoteEditView
}

extension NoteViewBuilding {
    func makeNoteEditView(note: JournalNote, router: JournalRouting) -> NoteEditView {
        return NoteEditView(note: note, router: router)
    }
}

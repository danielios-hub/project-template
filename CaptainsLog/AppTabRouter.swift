//
//  AppTabRouter.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 17/1/26.
//

import Foundation
import SwiftUI

@Observable
class AppTabRouter {
    
    public init(path: NavigationPath = NavigationPath()) {
        self.path = path
    }
    
    enum JournalRoute: Hashable {
        case editNote(JournalNote)
        case newNote(JournalNote)
    }
    
    var path = NavigationPath()
    
    func pop() {
        path.removeLast()
    }
    
    func goToEditNote(note: JournalNote) {
        path.append(JournalRoute.editNote(note))
    }
    
    func goToNewNote() {
        let note = JournalNote(title: "New Note", descriptionNote: "empty", mood: .high)
        path.append(JournalRoute.newNote(note))
    }
    
    func buildView(route: JournalRoute) -> some View {
        switch route {
        case .editNote(let note):
            makeEditNoteViewModel(note: note)
        case .newNote(let newNote):
            makeEditNoteViewModel(note: newNote)
        }
    }
    
    private func makeEditNoteViewModel(note: JournalNote) -> NoteEditView {
        return NoteEditView(note: note, router: self)
    }
}

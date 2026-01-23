//
//  MoreTabRouter.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 25/1/26.
//

import SwiftUI

@Observable
class MoreTabRouter: JournalRouting, NoteViewBuilding {
    public init(path: NavigationPath = NavigationPath()) {
        self.path = path
    }
    
    enum MoreRoute: Hashable {
        case newNote(JournalNote)
        case editNote(JournalNote)
    }
    
    var path = NavigationPath()
    
    func pop() {
        path.removeLast()
    }
    
    func goToNewNote() {
        let note = JournalNote(title: "New Note", descriptionNote: "empty", mood: .high)
        path.append(MoreRoute.newNote(note))
    }
    
    func goToEditNote(note: JournalNote) {
        path.append(MoreRoute.editNote(note))
    }
    
    @ViewBuilder
    func buildView(route: MoreRoute) -> some View {
        switch route {
        case .newNote(let note):
            makeNoteEditView(note: note, router: self)
        case .editNote(let note):
            makeNoteEditView(note: note, router: self)
        }
    }
}

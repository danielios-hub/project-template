//
//  File.swift
//  More
//
//  Created by Daniel Gallego Peralta on 7/2/26.
//

import Foundation
import Core

@Observable
final class MoreViewModel {
    var router: AppRouting
    
    init(router: AppRouting) {
        self.router = router
    }
    
    func goToNewNote() {
        let note = JournalNote(title: "New Note", descriptionNote: "empty", mood: .high)
        router.navigateTo(journalRoute: .newNote(note))
    }
}

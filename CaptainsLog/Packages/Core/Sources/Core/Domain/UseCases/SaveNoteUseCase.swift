//
//  File.swift
//  Core
//
//  Created by Daniel Gallego Peralta on 7/2/26.
//

import Foundation
import Dependencies

public struct SaveNoteUseCase {
    @Dependency(\.notesRepository) var notesRepository: NotesRepository
    
    public init() {}

    @MainActor
    public func invoke(_ note: JournalNote) {
        notesRepository.saveNote(note)
    }
}

extension SaveNoteUseCase: DependencyKey {
    public static let liveValue = SaveNoteUseCase()
}

public extension DependencyValues {
  var saveNoteUseCase: SaveNoteUseCase {
    get { self[SaveNoteUseCase.self] }
    set { self[SaveNoteUseCase.self] = newValue }
  }
}

//
//  File.swift
//  Core
//
//  Created by Daniel Gallego Peralta on 7/2/26.
//

import SwiftData
import Dependencies

public protocol NotesRepository {
    @MainActor
    func getNotes() async throws -> [JournalNote]
    
    @MainActor
    func saveNote(_ note: JournalNote)
    
    @MainActor
    func deleteNote(_ note: JournalNote)
}

public struct NotesRepositoryImpl: NotesRepository {
    @Dependency(\.dataContainer) var dataContainer: SwiftDataContainer
    
    @MainActor
    public func getNotes() async throws -> [JournalNote] {
        let descriptor = FetchDescriptor<JournalNote>()
        return try dataContainer.container.mainContext.fetch(descriptor)
    }
    
    @MainActor
    public func saveNote(_ note: JournalNote) {
        dataContainer.container.mainContext.insert(note)
    }
    
    @MainActor
    public func deleteNote(_ note: JournalNote) {
        dataContainer.container.mainContext.delete(note)
    }
}

enum NotesRepositoryKey: DependencyKey {
    public static let liveValue: NotesRepository = NotesRepositoryImpl()
}

public extension DependencyValues {
  var notesRepository: NotesRepository {
    get { self[NotesRepositoryKey.self] }
    set { self[NotesRepositoryKey.self] = newValue }
  }
}

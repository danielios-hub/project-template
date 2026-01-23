//
//  GetNotesUseCase.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 13/4/25.
//

import SwiftData
import Dependencies

struct GetNotesUseCase {
    @Dependency(\.dataContainer) var dataContainer: SwiftDataContainer
    
    @MainActor
    func invoke() async throws -> [JournalNote] {
        let descriptor = FetchDescriptor<JournalNote>()
        return try dataContainer.container.mainContext.fetch(descriptor)
    }
    
    @MainActor
    func saveNote(_ note: JournalNote) {
        dataContainer.container.mainContext.insert(note)
    }
    
    @MainActor
    func deleteNote(_ note: JournalNote) {
        dataContainer.container.mainContext.delete(note)
    }
}

extension GetNotesUseCase: DependencyKey {
    static let liveValue = GetNotesUseCase()
}

extension DependencyValues {
  var getNotesUseCase: GetNotesUseCase {
    get { self[GetNotesUseCase.self] }
    set { self[GetNotesUseCase.self] = newValue }
  }
}

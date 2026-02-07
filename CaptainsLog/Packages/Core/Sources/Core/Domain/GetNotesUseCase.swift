//
//  GetNotesUseCase.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 13/4/25.
//

import SwiftData
import Dependencies

public struct GetNotesUseCase {
    @Dependency(\.dataContainer) var dataContainer: SwiftDataContainer
    
    public init() {}
    
    @MainActor
    public func invoke() async throws -> [JournalNote] {
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

extension GetNotesUseCase: DependencyKey {
    public static let liveValue = GetNotesUseCase()
}

public extension DependencyValues {
  var getNotesUseCase: GetNotesUseCase {
    get { self[GetNotesUseCase.self] }
    set { self[GetNotesUseCase.self] = newValue }
  }
}

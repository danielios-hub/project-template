import SwiftData
@preconcurrency import Dependencies

public protocol NotesRepository: Sendable {
    @MainActor
    func getNotes() async throws -> [JournalNote]
    
    @MainActor
    func saveNote(_ note: JournalNote) async
    
    @MainActor
    func deleteNote(_ note: JournalNote) async
}

public struct NotesRepositoryImpl: NotesRepository, Sendable {
    @Dependency(\.dataContainer) var dataContainer: SwiftDataContainer
    
    public func getNotes() async throws -> [JournalNote] {
        let descriptor = FetchDescriptor<JournalNote>()
        return try dataContainer.container.mainContext.fetch(descriptor)
    }
    
    public func saveNote(_ note: JournalNote) async {
        dataContainer.container.mainContext.insert(note)
    }
    
    public func deleteNote(_ note: JournalNote) async {
        dataContainer.container.mainContext.delete(note)
    }
}

enum NotesRepositoryKey: DependencyKey {
    public static let liveValue: any NotesRepository = NotesRepositoryImpl()
}

public extension DependencyValues {
  var notesRepository: any NotesRepository {
    get { self[NotesRepositoryKey.self] }
    set { self[NotesRepositoryKey.self] = newValue }
  }
}

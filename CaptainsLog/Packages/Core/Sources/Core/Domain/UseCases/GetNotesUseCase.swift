import SwiftData
import Dependencies

public struct GetNotesUseCase {
    @Dependency(\.notesRepository) var notesRepository: NotesRepository
    
    public init() {}
    
    @MainActor
    public func invoke() async throws -> [JournalNote] {
        try await notesRepository.getNotes()
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

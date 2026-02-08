import Foundation
@preconcurrency import Dependencies

public struct SaveNoteUseCase {
    @Dependency(\.notesRepository) var notesRepository: NotesRepository
    
    public init() {}

    @MainActor
    public func invoke(_ note: JournalNote) async {
        await notesRepository.saveNote(note)
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

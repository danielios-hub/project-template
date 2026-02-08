import Foundation
@preconcurrency import Dependencies

public struct DeleteNoteUseCase {
    @Dependency(\.notesRepository) var notesRepository: NotesRepository
    
    public init() {}
    
    @MainActor
    public func invoke(_ note: JournalNote) async {
        await notesRepository.deleteNote(note)
    }
}

extension DeleteNoteUseCase: DependencyKey {
    public static let liveValue = DeleteNoteUseCase()
}

public extension DependencyValues {
  var deleteNoteUseCase: DeleteNoteUseCase {
    get { self[DeleteNoteUseCase.self] }
    set { self[DeleteNoteUseCase.self] = newValue }
  }
}

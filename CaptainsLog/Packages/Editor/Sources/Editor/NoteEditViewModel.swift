import Foundation
import Dependencies
import Core

@Observable
public final class NoteEditViewModel {
    var note: JournalNote
    private var router: AppRouting
    @ObservationIgnored
    @Dependency(\.deleteNoteUseCase) var deleteNoteUseCase
    
    public init(note: JournalNote, router: AppRouting) {
        self.note = note
        self.router = router
    }
    
    @MainActor
    public func delete() {
        deleteNoteUseCase.invoke(note)
        router.pop()
    }
}

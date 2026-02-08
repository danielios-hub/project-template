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
    
    public func delete() {
        Task {
            await deleteNoteUseCase.invoke(note)
            router.pop()
        }
    }
}

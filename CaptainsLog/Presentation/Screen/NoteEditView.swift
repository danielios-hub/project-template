import SwiftUI
import SwiftData
import Dependencies

@Observable
final class NoteEditViewModel {
    var note: JournalNote
    private var router: JournalRouting
    @ObservationIgnored
    @Dependency(\.getNotesUseCase) var getNotes
    
    init(note: JournalNote, router: JournalRouting) {
        self.note = note
        self.router = router
    }
    
    @MainActor
    func delete() {
        getNotes.deleteNote(note)
        router.pop()
    }
}

struct NoteEditView: View {
    @State var viewModel: NoteEditViewModel
    
    init(
        note: JournalNote,
        router: JournalRouting
    ) {
        _viewModel = .init(
            wrappedValue: NoteEditViewModel(
                note: note,
                router: router)
        )
    }
    
    var body: some View {
        VStack {
            TextField("Title", text: $viewModel.note.title)
            
            Button("Delete") {
                viewModel.delete()
            }
        }
    }
}

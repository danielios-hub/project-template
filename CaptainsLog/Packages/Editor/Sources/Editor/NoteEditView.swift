import Core
import SwiftUI

import Dependencies

@Observable
public final class NoteEditViewModel {
    var note: JournalNote
    private var router: AppRouting
    @ObservationIgnored
    @Dependency(\.getNotesUseCase) var getNotes
    
    public init(note: JournalNote, router: AppRouting) {
        self.note = note
        self.router = router
    }
    
    @MainActor
    public func delete() {
        getNotes.deleteNote(note)
        router.pop()
    }
}

public struct NoteEditView: View {
    @State var viewModel: NoteEditViewModel
    
    public init(viewModel: NoteEditViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            TextField("Title", text: $viewModel.note.title)
            
            Button("Delete") {
                viewModel.delete()
            }
        }
    }
}

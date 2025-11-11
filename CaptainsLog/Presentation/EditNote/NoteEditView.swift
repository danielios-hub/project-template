import SwiftUI
import SwiftData

struct NoteEditView: View {
    @Bindable var note: JournalNote
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    init(note: JournalNote) {
        self.note = note
    }
    
    var body: some View {
        VStack {
            TextField("Title", text: $note.title)
            
            Button("Delete") {
                modelContext.delete(note)
                dismiss()
            }
        }
    }
}

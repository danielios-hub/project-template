import SwiftUI
import Core

struct NoteList: View {
    let notes: [JournalNote]
    let onNoteTapped: (JournalNote) -> Void
    
    var body: some View {
        List {
            ForEach(notes) { note in
                VStack(alignment: .leading, spacing: 4) {
                   Text(note.title)
                    Text(note.descriptionNote)
                }
                .onTapGesture {
                    onNoteTapped(note)
                }
            }
        }
    }
}

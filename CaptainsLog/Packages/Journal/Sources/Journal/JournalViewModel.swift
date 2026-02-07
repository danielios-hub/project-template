import Foundation
import Core
import Editor
import Dependencies

@Observable
final class JournalViewModel {
    var router: AppRouting
    var newNoteTitle: String = ""
    var newNoteDescription: String = ""
    @ObservationIgnored
    @Dependency(\.getNotesUseCase) var getNotes
    
    init(router: AppRouting) {
        self.router = router
    }
    
    @MainActor
    func addNote() {
        let note = JournalNote(
            title: newNoteTitle,
            descriptionNote: newNoteDescription,
            mood: .high
        )
        
        getNotes.saveNote(note)
        
        newNoteTitle = ""
        newNoteDescription = ""
        router.navigateTo(journalRoute: .newNote(note))
    }
    
    func goToEditNote(note: JournalNote) {
        router.navigateTo(journalRoute: .noteDetail(note))
    }
    
    func goToNewsDetail() {
        let article = NewsArticle(
            title: "Breaking News: Manual Navigation",
            summary: "This article was opened from the Journal module.",
            content: "This demonstrates cross-module navigation from Journal -> News."
        )
        router.navigateTo(newsRoute: .detail(article))
    }
}

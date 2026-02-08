import Foundation
import Core

@Observable
public final class NewsDetailViewModel {
    let article: NewsArticle
    let router: AppRouting
    
    public init(article: NewsArticle, router: AppRouting) {
        self.article = article
        self.router = router
    }
    
    func goToNote() {
        let note = JournalNote(
            title: "Re: \(article.title)",
            descriptionNote: "Thoughts on: \(article.summary)",
            mood: .medium
        )
        router.navigateTo(journalRoute: .newNote(note))
    }
}

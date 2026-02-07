import SwiftUI
import Core

@Observable
final class NewsListViewModel {
    var router: AppRouting
    
    let articles = [
        NewsArticle(title: "Captain's Log v2.0 Released", summary: "Major update with improved navigation.", content: "We are excited to announce the release of Captain's Log v2.0. This update brings a completely new navigation architecture based on modules..."),
        NewsArticle(title: "Tips for Better Journaling", summary: "How to make the most out of your daily logs.", content: "Journaling is a powerful tool for self-reflection. Here are some tips to help you get started...")
    ]
    
    public init(router: AppRouting) {
        self.router = router
    }
    
    func onArticleTapped(article: NewsArticle) {
        router.navigateTo(newsRoute: .detail(article))
    }
}

public struct NewsListView: View {
    @State var viewModel: NewsListViewModel
    
    public var body: some View {
        List(viewModel.articles) { article in
            Button {
                viewModel.onArticleTapped(article: article)
            } label: {
                VStack(alignment: .leading, spacing: 8) {
                    Text(article.title)
                        .font(.headline)
                    Text(article.summary)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("News")
    }
}

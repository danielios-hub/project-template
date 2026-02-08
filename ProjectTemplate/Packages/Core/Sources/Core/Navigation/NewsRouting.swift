import SwiftUI

public enum NewsRoute: Hashable {
    case detail(NewsArticle)
}

extension AppRouter {
    public func navigateTo(newsRoute: NewsRoute) {
        switch newsRoute {
        case .detail(let newsArticle):
            navigate(to: .news(.detail(newsArticle)))
        }
    }
}

import SwiftUI
import Journal
import News
import Core
import StyleGuide

@Observable
final class AppContainer {
    let viewFactory = RootViewFactory()
    
    func makeRouter() -> AppRouter {
        AppRouter(viewBuilder: viewFactory)
    }
}

enum Tab {
    case journal
    case news
    
    var title: String {
        switch self {
        case .journal:
            return "Journal"
        case .news:
            return "News"
        }
    }
    
    var systemImage: String {
        switch self {
        case .journal:
            return "note.text"
        case .news:
            return "newspaper"
        }
    }
}

@Observable
final class MainTabBarViewModel {
    var selectedTab: Tab = .journal
}

struct MainTabbarView: View {
    @Environment(\.theme) private var theme
    @State var viewModel = MainTabBarViewModel()
    @State var appContainer = AppContainer()
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $viewModel.selectedTab) {
                JournalCoordinator(router: appContainer.makeRouter())
                    .tabItem {
                        Label(
                            Tab.journal.title,
                            systemImage: Tab.journal.systemImage
                        )
                    }
                    .tag(Tab.journal)
                
                NewsCoordinatorView(router: appContainer.makeRouter())
                    .tabItem {
                        Label(
                            Tab.news.title,
                            systemImage: Tab.news.systemImage
                        )
                    }
                    .tag(Tab.news)
            }
        .tint(theme.colors.primary)
        }
    }
}

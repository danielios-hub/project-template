import SwiftUI
import Journal
import More
import News
import Core

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
    case more
    
    var title: String {
        switch self {
        case .journal:
            return "Journal"
        case .news:
            return "News"
        case .more:
            return "More"
        }
    }
    
    var systemImage: String {
        switch self {
        case .journal:
            return "note.text"
        case .news:
            return "newspaper"
        case .more:
            return "ellipsis"
        }
    }
}

@Observable
final class MainTabBarViewModel {
    var selectedTab: Tab = .journal
}

struct MainTabbarView: View {
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
                

                MoreCoordinator(router: appContainer.makeRouter())
                    .tabItem {
                        Label(
                            Tab.more.title,
                            systemImage: Tab.more.systemImage
                        )
                    }
                    .tag(Tab.more)
            }
        }
    }
}

import SwiftUI

enum Tab {
    case journal
    case more
    
    var title: String {
        switch self {
        case .journal:
            return "Journal"
        case .more:
            return "More"
        }
    }
    
    var systemImage: String {
        switch self {
        case .journal:
            return "note.text"
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
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $viewModel.selectedTab) {
                JournalCoordinator()
                    .tabItem {
                        Label(
                            Tab.journal.title,
                            systemImage: Tab.journal.systemImage
                        )
                    }
                    .tag(Tab.journal)
                

                MoreCoordinator()
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

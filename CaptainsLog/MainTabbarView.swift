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

@Observable
class AppTabRouter {
    enum JournalRoute: Hashable {
        case editNote(JournalNote)
        case newNote(JournalNote)
    }
    
    var path = NavigationPath()
    
    func goToEditNote(note: JournalNote) {
        path.append(JournalRoute.editNote(note))
    }
    
    func goToNewNote() {
        let note = JournalNote(title: "New Note", descriptionNote: "empty", mood: .high)
        path.append(JournalRoute.newNote(note))
    }
    
    func buildView(route: JournalRoute) -> some View {
        switch route {
        case .editNote(let note):
            NoteEditView(note: note)
        case .newNote(let newNote):
            NoteEditView(note: newNote)
        }
    }
}

struct MainTabbarView: View {
    @State var viewModel: MainTabBarViewModel
    let factory: ViewModelFactory
    @Bindable var router: AppTabRouter = AppTabRouter()
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $viewModel.selectedTab) {
                JournalView(viewModel: factory.makeJournalViewModel())
                    .tabItem {
                        Label(
                            Tab.journal.title,
                            systemImage: Tab.journal.systemImage
                        )
                    }
                    .tag(Tab.journal)
                

                MoreView()
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

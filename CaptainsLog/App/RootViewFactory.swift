import SwiftUI
import Core
import Journal
import Editor
import News

struct RootViewFactory: ViewBuilding {
    func buildView(for route: AppRoute, router: AppRouter) -> AnyView {
        AnyView(buildBody(for: route, router: router))
    }
    
    @ViewBuilder
    func buildBody(for route: AppRoute, router: AppRouter) -> some View {
        switch route {
        case .journal(let journalRoute):
            switch journalRoute {
            case .newNote(let newNote):
                let viewModel = NoteEditViewModel(note: newNote, router: router)
                NoteEditView(viewModel: viewModel)
            case .noteDetail(let note):
                let viewModel = NoteEditViewModel(note: note, router: router)
                NoteEditView(viewModel: viewModel)
            }
        case .news(let newsRoute):
            switch newsRoute {
            case .detail(let article):
                NewsDetailView(
                    viewModel: NewsDetailViewModel(
                        article: article,
                        router: router
                    )
                )
            }
        }
    }
}

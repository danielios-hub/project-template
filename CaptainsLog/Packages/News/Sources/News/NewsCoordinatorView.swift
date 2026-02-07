import SwiftUI
import Core
import Editor

public struct NewsCoordinatorView: View {
    @State private var router: AppRouter
    
    public init(router: AppRouter) {
        self.router = router
    }
    
    public var body: some View {
        NavigationStack(path: $router.path) {
            NewsListView(viewModel: NewsListViewModel(router: router))
                .navigationDestination(for: AppRoute.self) { route in
                    router.view(for: route)
                }
        }
    }
}

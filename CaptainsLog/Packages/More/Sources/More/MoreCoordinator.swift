import SwiftUI
import Core

public struct MoreCoordinator: View {
    @State var router: AppRouter
    
    public init(router: AppRouter) {
        self.router = router
    }
    
    public var body: some View {
        NavigationStack(path: $router.path) {
            MoreView(viewModel: MoreViewModel(router: router))
                .navigationDestination(for: AppRoute.self) { route in
                    router.view(for: route)
                }
        }
    }
}

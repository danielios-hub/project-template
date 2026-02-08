import SwiftUI

public enum AppRoute: Hashable {
    case journal(JournalRoute)
    case news(NewsRoute)
}

@MainActor
public protocol AppRouting: Sendable {
    func navigateTo(journalRoute: JournalRoute)
    func navigateTo(newsRoute: NewsRoute)
    func pop()
}

@MainActor
public protocol ViewBuilding: Sendable {
    func buildView(for route: AppRoute, router: AppRouter) -> AnyView
}

@MainActor
@Observable
public class AppRouter: AppRouting {
    public var path = NavigationPath()
    private let viewBuilder: ViewBuilding
    
    public init(viewBuilder: ViewBuilding) {
        self.viewBuilder = viewBuilder
    }
    
    public func view(for route: AppRoute) -> AnyView {
        viewBuilder.buildView(for: route, router: self)
    }
    
    public func navigate(to route: AppRoute) {
        path.append(route)
    }
    
    public func pop() {
        path.removeLast()
    }
}

//
//  File.swift
//  Journal
//
//  Created by Daniel Gallego Peralta on 7/2/26.
//

import SwiftUI
import Core

public struct JournalCoordinator: View {
    @State var router: AppRouter
    
    public init(router: AppRouter) {
        self.router = router
    }
    
    public var body: some View {
        NavigationStack(path: $router.path) {
            JournalView(viewModel: JournalViewModel(router: router))
                .navigationDestination(for: AppRoute.self) { route in
                    router.view(for: route)
                }
        }
    }
}

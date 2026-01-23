//
//  MoreView.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 5/9/25.
//

import SwiftUI

@Observable
final class MoreViewModel {
    var router: AppTabRouter
    
    init(router: AppTabRouter) {
        self.router = router
    }
    
    func goToNewNote() {
        router.goToNewNote()
    }
}

struct MoreView: View {
    @State var viewModel = MoreViewModel(router: AppTabRouter())
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack(path: $viewModel.router.path) {
            VStack {
                Spacer()
                Button(action: {
                    viewModel.goToNewNote()
                }, label: {
                    Text("New Note")
                })
                
                Spacer()
            }
            .navigationDestination(for: AppTabRouter.JournalRoute.self, destination: { route in
                viewModel.router.buildView(route: route)
            })
        }
    }
}

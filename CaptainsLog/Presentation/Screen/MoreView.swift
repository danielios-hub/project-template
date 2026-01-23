//
//  MoreView.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 5/9/25.
//

import SwiftUI

@Observable
final class MoreViewModel {
    var router: JournalRouting
    
    init(router: JournalRouting) {
        self.router = router
    }
    
    func goToNewNote() {
        router.goToNewNote()
    }
}

struct MoreCoordinator: View {
    @State var router = MoreTabRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            MoreView(viewModel: MoreViewModel(router: router))
                .navigationDestination(for: MoreTabRouter.MoreRoute.self) { route in
                    router.buildView(route: route)
                }
        }
    }
}

struct MoreView: View {
    @State var viewModel: MoreViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                viewModel.goToNewNote()
            }, label: {
                Text("New Note")
            })
            
            Spacer()
        }
    }
}

//
//  MoreView.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 5/9/25.
//

import SwiftUI

struct MoreView: View {
    @Bindable var router: AppTabRouter = AppTabRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                Spacer()
                Button(action: {
                    router.goToNewNote()
                }, label: {
                    Text("New Note")
                })
                
                Spacer()
            }
            .navigationDestination(for: AppTabRouter.JournalRoute.self, destination: { route in
                router.buildView(route: route)
            })
        }
    }
}

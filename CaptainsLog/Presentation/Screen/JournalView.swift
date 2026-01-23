//
//  ContentView.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 5/4/25.
//

import SwiftUI
import SwiftData
import Dependencies

@Observable
final class JournalViewModel {
    var router: AppTabRouter
    //var notes: [JournalNote] = []
    var newNoteTitle: String = ""
    var newNoteDescription: String = ""
    @ObservationIgnored
    @Dependency(\.getNotesUseCase) var getNotes
    
    init(router: AppTabRouter) {
        self.router = router
    }
    
    @MainActor
    func addNote() {
        let note = JournalNote(
            title: newNoteTitle,
            descriptionNote: newNoteDescription,
            mood: .high
        )
        
        getNotes.saveNote(note)
        
        newNoteTitle = ""
        newNoteDescription = ""
        router.goToEditNote(note: note)
    }
    
    func goToEditNote(note: JournalNote) {
        router.goToEditNote(note: note)
    }
}

struct JournalView: View {
    @State var viewModel = JournalViewModel(router: AppTabRouter())
    @Query var notes: [JournalNote]
    
    var body: some View {
        NavigationStack(path: $viewModel.router.path) {
            VStack {
                AddTodayMoodView(
                    noteTitle: $viewModel.newNoteTitle,
                    onAddNote: {
                        viewModel.addNote()
                    }
                )
                    .padding()
                
                NoteList(
                    notes: notes,
                    onNoteTapped: {
                        viewModel.goToEditNote(note: $0)
                    }
                )
            }
            .navigationDestination(for: AppTabRouter.JournalRoute.self, destination: { route in
                viewModel.router.buildView(route: route)
            })
        }
        
    }
}

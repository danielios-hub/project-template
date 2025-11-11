//
//  ContentView.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 5/4/25.
//

import SwiftUI
import SwiftData

@Observable
final class JournalViewModel {
    var notes: [JournalNote] = []
    var newNoteTitle: String = ""
    var newNoteDescription: String = ""
    let getNotes: GetNotesUseCase
    
    init(getNotes: GetNotesUseCase) {
        self.getNotes = getNotes
    }
    
    @MainActor
    func loadNotes(using context: ModelContext) async {
        self.notes = try! await getNotes.invoke()
    }
    
    func addNote(context: ModelContext, router: AppTabRouter) {
        let note = JournalNote(
            title: newNoteTitle,
            descriptionNote: newNoteDescription,
            mood: .high
        )
        
        notes
            .insert(
                note,
                at: 0
            )
        
        context.insert(note)
        
        newNoteTitle = ""
        newNoteDescription = ""
        router.goToEditNote(note: note)
    }
}

struct JournalView: View {
    @State var viewModel: JournalViewModel
    @Environment(\.modelContext) private var modelContext
    @Bindable var router: AppTabRouter = AppTabRouter()
    
    init(viewModel: JournalViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                AddTodayMoodView(
                    noteTitle: $viewModel.newNoteTitle,
                    onAddNote: {
                        viewModel.addNote(context: modelContext, router: router)
                    }
                )
                    .padding()
                
                NoteList(notes: viewModel.notes)
                    .environment(router)
            }
            .navigationDestination(for: AppTabRouter.JournalRoute.self, destination: { route in
                router.buildView(route: route)
            })
            .task {
                await viewModel.loadNotes(using: modelContext)
            }
        }
        
    }
}



struct NoteList: View {
    let notes: [JournalNote]
    @Environment(AppTabRouter.self) private var router: AppTabRouter
    
    var body: some View {
        List {
            ForEach(notes) { note in
                VStack(alignment: .leading, spacing: 4) {
                   Text(note.title)
                    Text(note.descriptionNote)
                }
                .onTapGesture {
                    router.goToEditNote(note: note)
                }
            }
        }
    }
}

//#Preview {
//    JournalView(viewModel: JournalViewModel())
//}

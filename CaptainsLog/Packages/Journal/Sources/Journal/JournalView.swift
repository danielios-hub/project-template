//
//  ContentView.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 5/4/25.
//

import SwiftUI
import SwiftData
import Core

struct JournalView: View {
    @State var viewModel: JournalViewModel
    @Query var notes: [JournalNote]
    
    var body: some View {
        VStack {
            AddTodayMoodView(
                noteTitle: $viewModel.newNoteTitle,
                onAddNote: {
                    viewModel.addNote()
                }
            )
            .padding()
            
            Button("Read Latest News") {
                viewModel.goToNewsDetail()
            }
            .padding(.bottom)
            
            NoteList(
                notes: notes,
                onNoteTapped: {
                    viewModel.goToEditNote(note: $0)
                }
            )
        }
    }
}

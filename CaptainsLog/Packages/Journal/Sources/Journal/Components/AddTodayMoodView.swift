import SwiftUI
import Core

struct AddTodayMoodView: View {
    var noteTitle: Binding<String>
    var onAddNote: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text("What is your mood today?")
                    .font(.headline)
                
                TextField("Title", text: noteTitle)
                    .textFieldStyle(.roundedBorder)
            }
            
            VStack(spacing: 8) {
                Button(action: {
                    
                }) {
                    ZStack {
                        Circle()
                            .stroke(Color.gray, lineWidth: 1)
                        
                        Text("😁")
                            .font(.largeTitle)
                            .padding(.all, 8)
                    }
                    .frame(width: 60, height: 60)
                }
                
                Button("Add") {
                    onAddNote()
                }
            }
            
            
        }
    }
}

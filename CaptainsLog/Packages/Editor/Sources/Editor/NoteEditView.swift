import Core
import SwiftUI

public struct NoteEditView: View {
    @State var viewModel: NoteEditViewModel
    
    public init(viewModel: NoteEditViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            TextField("Title", text: $viewModel.note.title)
            
            Button("Delete") {
                viewModel.delete()
            }
        }
    }
}

import SwiftUI

import Core
import Editor

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

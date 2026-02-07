import SwiftUI
import Core

public struct NewsDetailView: View {
    @State var viewModel: NewsDetailViewModel
    
    public init(viewModel: NewsDetailViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.article.title)
                    .font(.largeTitle)
                    .bold()
                
                Text(viewModel.article.date.formatted(date: .long, time: .shortened))
                    .foregroundStyle(.secondary)
                
                Text(viewModel.article.content)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle("Article")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Create Note") {
                    viewModel.goToNote()
                }
            }
        }
    }
}

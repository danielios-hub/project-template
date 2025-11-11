import SwiftUI
import SwiftData

@main
struct CaptainsLogApp: App {
    let container: ModelContainer
    let factory: ViewModelFactory
    
    init() {
        let storeURL = URL.documentsDirectory.appending(path: "database.sqlite")
        let schema = Schema([JournalNote.self])
        let config = ModelConfiguration(schema: schema, url: storeURL)
        //let config2 = ModelConfiguration(for: Comment.self, isStoredInMemoryOnly: true)

        container = try! ModelContainer(for: schema, configurations: config)
        //container.mainContext.autosaveEnabled = true
        self.factory = ViewModelFactory(container: container)
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabbarView(
                viewModel: factory.makeTabBarViewModel(),
                factory: factory
            )
            .modelContainer(container)
        }
    }
}

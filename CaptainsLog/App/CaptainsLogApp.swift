import SwiftUI
import SwiftData
import Dependencies
import Core

@main
struct CaptainsLogApp: App {
    @Dependency(\.dataContainer) var dataContainer: SwiftDataContainer
    
    init() {}
    
    var body: some Scene {
        WindowGroup {
            MainTabbarView()
                .modelContainer(dataContainer.container)
        }
    }
}

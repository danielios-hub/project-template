import SwiftUI
import SwiftData
import Dependencies

@main
struct CaptainsLogApp: App {
    @Dependency(\.dataContainer) var dataContainer: SwiftDataContainer
    
    init() {
        @Dependency(\.dataContainer) var dataContainer: SwiftDataContainer
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabbarView()
                .modelContainer(dataContainer.container)
        }
    }
}

import SwiftUI
import SwiftData
import Dependencies
import Core
import StyleGuide

@main
struct ProjectTemplateApp: App {
    @Dependency(\.dataContainer) var dataContainer: SwiftDataContainer
    
    init() {}
    
    var body: some Scene {
        WindowGroup {
            MainTabbarView()
                .modelContainer(dataContainer.container)
                .theme(DefaultTheme())
        }
    }
}

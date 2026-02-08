import Foundation
import SwiftData
@preconcurrency import Dependencies

public struct SwiftDataContainer: Sendable {
    public let container: ModelContainer
    
    public init() {
        let storeURL = URL.documentsDirectory.appending(path: "database.sqlite")
        let schema = Schema([JournalNote.self])
        let config = ModelConfiguration(schema: schema, url: storeURL)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Failed to initialize SwiftData container: \(error)")
        }
    }
    
    public init(container: ModelContainer) {
        self.container = container
    }
}

extension SwiftDataContainer: DependencyKey {
    public static let liveValue = SwiftDataContainer()
    public static let testValue: SwiftDataContainer = {
        let schema = Schema([JournalNote.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        do {
            let container = try ModelContainer(for: schema, configurations: config)
            return SwiftDataContainer(container: container)
        } catch {
            fatalError("Failed to initialize test SwiftData container: \(error)")
        }
    }()
}

public extension DependencyValues {
  var dataContainer: SwiftDataContainer {
    get { self[SwiftDataContainer.self] }
    set { self[SwiftDataContainer.self] = newValue }
  }
}

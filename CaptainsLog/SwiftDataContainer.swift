//
//  SwiftDataContainer.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 18/1/26.
//
import Foundation
import SwiftData
import Dependencies

struct SwiftDataContainer {
    let container: ModelContainer
    
    public init() {
        let storeURL = URL.documentsDirectory.appending(path: "database.sqlite")
        let schema = Schema([JournalNote.self])
        let config = ModelConfiguration(schema: schema, url: storeURL)
        container = try! ModelContainer(for: schema, configurations: config)
    }
    
    public init(container: ModelContainer) {
        self.container = container
    }
}

extension SwiftDataContainer: DependencyKey {
    static let liveValue = SwiftDataContainer()
    static let testValue: SwiftDataContainer = {
        let schema = Schema([JournalNote.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: schema, configurations: config)
        return SwiftDataContainer(container: container)
    }()
}

extension DependencyValues {
  var dataContainer: SwiftDataContainer {
    get { self[SwiftDataContainer.self] }
    set { self[SwiftDataContainer.self] = newValue }
  }
}

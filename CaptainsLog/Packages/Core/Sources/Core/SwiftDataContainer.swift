//
//  SwiftDataContainer.swift
//  CaptainsLog
//
//  Created by Daniel Gallego Peralta on 18/1/26.
//
import Foundation
import SwiftData
import Dependencies

import Foundation
import SwiftData
import Dependencies

public struct SwiftDataContainer {
    public let container: ModelContainer
    
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
    public static let liveValue = SwiftDataContainer()
    public static let testValue: SwiftDataContainer = {
        let schema = Schema([JournalNote.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: schema, configurations: config)
        return SwiftDataContainer(container: container)
    }()
}

public extension DependencyValues {
  var dataContainer: SwiftDataContainer {
    get { self[SwiftDataContainer.self] }
    set { self[SwiftDataContainer.self] = newValue }
  }
}

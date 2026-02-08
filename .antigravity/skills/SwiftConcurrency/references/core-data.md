# Core Data and Swift Concurrency

## Core Principles
- **Thread Safety**: `NSManagedObjectContext` and `NSManagedObject` are NOT thread-safe for direct access across tasks.
- **Sendability**: `NSManagedObjectID` IS `Sendable`. Pass IDs between tasks, not the objects themselves.

## Available Async APIs
Use `perform { }` or `performAndWait { }` to access Core Data state.

## Data Access Objects (DAO) Pattern
Encapsulate Core Data work in a separate layer that returns plain `Sendable` structs or values instead of managed objects.

## Simple CoreDataStore Pattern
```swift
actor CoreDataStore {
    let container: NSPersistentContainer
    
    func perform<T>(_ block: @escaping (NSManagedObjectContext) throws -> T) async throws -> T {
        try await container.performBackgroundTask(block)
    }
}
```

## Default MainActor Isolation
Be careful with auto-generated subclasses in Xcode; consider manual code generation to control isolation.

## Best Practices
- Never pass `NSManagedObject` instances between tasks.
- Fetch objects within the `perform` block using IDs.
- Use `@MainActor` for the view-facing context.
- Enable Core Data concurrency debugging in Xcode schemes.

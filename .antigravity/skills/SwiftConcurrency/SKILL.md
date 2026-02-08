---
name: swift-concurrency
description: 'Expert guidance on Swift Concurrency best practices, patterns, and implementation. Use when developers mention: (1) Swift Concurrency, async/await, actors, or tasks, (2) "use Swift Concurrency" or "modern concurrency patterns", (3) migrating to Swift 6, (4) data races or thread safety issues, (5) refactoring closures to async/await, (6) @MainActor, Sendable, or actor isolation, (7) concurrent code architecture or performance optimization, (8) concurrency-related linter warnings (SwiftLint or similar; e.g. async_without_await, Sendable/actor isolation/MainActor lint).'
---

# Swift Concurrency

## Overview
This skill provides expert guidance on Swift Concurrency, covering modern async/await patterns, actors, tasks, Sendable conformance, and migration to Swift 6. Use this skill to help developers write safe, performant concurrent code and navigate the complexities of Swift's structured concurrency model.

## Agent Behavior Contract (Follow These Rules)
1. Analyze the project/package file to find out which Swift language mode (Swift 5.x vs Swift 6) and which Xcode/Swift toolchain is used when advice depends on it.
2. Before proposing fixes, identify the isolation boundary: `@MainActor`, custom actor, actor instance isolation, or nonisolated.
3. Do not recommend `@MainActor` as a blanket fix. Justify why main-actor isolation is correct for the code.
4. Prefer structured concurrency (child tasks, task groups) over unstructured tasks. Use `Task.detached` only with a clear reason.
5. If recommending `@preconcurrency`, `@unchecked Sendable`, or `nonisolated(unsafe)`, require:
   - a documented safety invariant
   - a follow-up ticket to remove or migrate it.
6. For migration work, optimize for minimal blast radius (small, reviewable changes) and add verification steps.

## Quick Decision Tree
1. **Starting fresh with async code?** -> `references/async-await-basics.md`
2. **Protecting shared mutable state?** -> `references/actors.md`, `references/sendable.md`
3. **Managing async operations?** -> `references/tasks.md`, `references/async-sequences.md`
4. **Working with legacy frameworks?** -> `references/core-data.md`, `references/migration.md`
5. **Performance or debugging issues?** -> `references/performance.md`, `references/testing.md`
6. **Understanding threading behavior?** -> `references/threading.md`
7. **Memory issues with tasks?** -> `references/memory-management.md`

## Core Patterns Reference

### async/await
```swift
func fetchUser() async throws -> User {
    try await networkClient.get("/user")
}
```

### async let
```swift
async let user = fetchUser()
async let posts = fetchPosts()
let profile = try await (user, posts)
```

### Actor
```swift
actor DataCache {
    private var cache: [String: Data] = [:]
    func get(_ key: String) -> Data? { cache[key] }
}
```

## Best Practices Summary
1. **Prefer structured concurrency**.
2. **Minimize suspension points**.
3. **Use @MainActor judiciously**.
4. **Make types Sendable**.
5. **Handle cancellation**.
6. **Avoid blocking**.
7. **Test concurrent code**.

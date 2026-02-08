# Tasks

## What is a Task?
A unit of asynchronous work. Every `async` function runs as part of a task.

## Cancellation
Check `Task.isCancelled` or call `Task.checkCancellation()` in long-running loops. Child tasks are automatically cancelled when their parent is cancelled.

## SwiftUI Integration
Use the `.task` modifier for automatic cancellation on view disappear.

## Task Groups
Use `withTaskGroup` or `withThrowingTaskGroup` for dynamic parallel work.

```swift
await withTaskGroup(of: String.self) { group in
    for url in urls {
        group.addTask { await fetch(url) }
    }
}
```

## Structured vs Unstructured Tasks
- **Structured**: `async let`, Task Groups. Lifetime is tied to the scope.
- **Unstructured**: `Task { }`, `Task.detached { }`. Need manual management/cancellation.

## Task Priorities
`.high`, `.medium`, `.low`, `.userInitiated`, `.utility`, `.background`.
Priority inheritance ensures subtasks run at the appropriate priority.

## Task.sleep vs Task.yield
- `Task.sleep(for:)`: Pauses the task for a duration.
- `Task.yield()`: Gives up the thread temporarily but remains ready to run.

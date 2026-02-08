# Memory Management

## Core Concepts
Tasks capture values just like closures. Because tasks can outlive the scope that created them, they can cause hidden retain cycles or memory leaks.

## Retain Cycles with Tasks
If a task strongly captures `self` and `self` stores that task, a retain cycle occurs.

## Breaking Retain Cycles
Use `[weak self]` in the task capture list for long-running operations.

```swift
Task { [weak self] in
    guard let self else { return }
    await self.doSomethingLong()
}
```

## One-Way Retention
Retaining `self` for the duration of a short-lived task is often intentional and acceptable (e.g., a simple save operation).

## Async Sequences and Retention
Infinite sequences (like notification streams) must be handled with care to avoid permanent retention of the observer.

## Isolated deinit (Swift 6.2+)
Classes with specified isolation can now have a `deinit` that runs on that isolation domain, simplifying cleanup of isolated state.

## Best Practices
- Use `weak self` for tasks that monitor long-running or infinite streams.
- Explicitly cancel stored tasks on `deinit` or view disappear.
- Use `guard let self else { return }` to gracefully exit if the owner is gone.

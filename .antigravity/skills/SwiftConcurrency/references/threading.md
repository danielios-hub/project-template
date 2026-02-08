# Threading

## Cooperative Thread Pool
Swift Concurrency uses a fixed-size thread pool (usually equal to the number of CPU cores). Avoid blocking these threads with semaphores or synchronous locks.

## Tasks vs Threads
Tasks are lightweight objects that can hop between different threads in the cooperative pool at suspension points.

## Threading Mindset → Isolation Mindset
Instead of thinking about "which thread", think about "which isolation domain" (@MainActor, an Actor instance, or nonisolated).

## Suspension Points (`await`)
When a task hits an `await`, it suspends. The thread is freed for other tasks. When the awaited work finishes, the original task resumes, potentially on a different thread.

## Swift 6.2 Changes
- Nonisolated async functions avoid unnecessary hops.
- `nonisolated(nonsending)` for safer parameter passing.

## Default Isolation Domain
Since Swift 6.0, nonisolated async functions default to the pool rather than inheriting isolation, improving performance and reducing deadlocks.

## Best Practices
- Keep actor-isolated sections small.
- Avoid passing non-Sendable types across boundaries.
- Don't rely on `Thread.isMainThread` for safety; use `@MainActor`.

# Actors

## What is an Actor?
A reference type that protects its mutable state by ensuring only one task can access it at a time. This prevents data races.

## Actor Isolation
- **Isolated**: Internal state and methods. Accessed via `await` from outside.
- **Nonisolated**: Methods that don't access mutable state can be marked `nonisolated` for synchronous access.

## Global Actors
- **@MainActor**: Synchronizes work on the main thread. Preferred for UI-bound code.
- **Custom Global Actors**: For domain-specific synchronization (e.g., a dedicated database actor).

## Actor Reentrancy
Actors are reentrant: while an actor is suspended at an `await`, it can start processing other tasks.
**Rule**: Always re-verify state after an `await` point, as the actor's state might have changed.

## #isolation Macro
Use to pass or check isolation at compile time or runtime.

## Mutex (Swift 6.0+)
`Mutex<Value>` is a high-performance alternative to actors for simple synchronous state protection. It is `Sendable`.

## Best Practices
- Prefer actors over locks or semaphores.
- Use `@MainActor` for ViewModels and UI classes.
- Keep actor methods focused to minimize contention.

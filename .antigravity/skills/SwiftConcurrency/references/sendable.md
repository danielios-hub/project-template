# Sendable

## What is Sendable?
A marker protocol that indicates a type is safe to share across isolation boundaries (threads/tasks).

## Value Types (Structs, Enums)
Implicitly `Sendable` if all their members are `Sendable`.

## Reference Types (Classes)
Classes can only be `Sendable` if they are `final`, have only immutable (`let`) `Sendable` properties, OR if they handle internal synchronization (e.g., via Actors or Locks).

## Functions and Closures (@Sendable)
Marking a closure as `@Sendable` ensures it only captures `Sendable` values, making it safe to run in a different isolation domain.

## @unchecked Sendable
Use when you manually guarantee thread safety for a type that the compiler can't verify (e.g., using a legacy lock).
**Warning**: This bypasses compiler safety checks.

## Region-Based Isolation (Swift 6.0+)
The compiler can now track "disconnected" islands of memory and allow non-Sendable types to cross boundaries if they are not used again in the original domain.

## Sending Keyword (Swift 6.0+)
Use `sending` in parameters or return types to indicate a value is being transferred to a new isolation region.

## Best Practices
- Prefer `Sendable` value types (structs).
- Use `final class` with immutable state for shared data.
- Avoid `@unchecked Sendable` unless absolutely necessary.

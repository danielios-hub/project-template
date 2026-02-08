# Linting & Concurrency

## SwiftLint Concurrency Rules
Avoid common pitfalls by enabling rules like `async_without_await`.

## async_without_await
**Warning**: An async function that doesn't use `await`.
- **Fix**: Remove `async` if unnecessary.
- **Suppression**: If required by protocol/override, suppress with a comment rather than adding dummy awaits.

## Compiler Warnings: Sendable & Isolation
The Swift compiler provides rich diagnostics for data races.
- **Minimal/Targeted**: Warning-based, bridges Swift 5 code.
- **Complete**: Error-based, enforces full data-race safety (Swift 6 default).

## Suppression Strategies
1. **Fix the design**: Use Actors or `Sendable` types.
2. **@preconcurrency**: For bridging legacy libraries.
3. **nonisolated(unsafe)**: For global variables that are manually protected.

## Documentation Requirements
Always document WHY a suppression is safe.

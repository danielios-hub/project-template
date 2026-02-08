# Async/Await Basics

## Function Declaration
Add `async` before the return type to mark a function as asynchronous. Use `throws` after `async` if it can also error.

## Calling Async Functions
- **From async context**: Use `await`.
- **From sync context**: Wrap in a `Task` or `Task { @MainActor in ... }`.

## Execution Order
`await` marks a suspension point. The runtime can pause the function and use the thread for other work until the awaited task completes.

## Parallel Execution with async let
Use `async let` for multiple independent operations.

```swift
async let user = fetchUser()
async let posts = fetchPosts()
let (u, p) = try await (user, posts)
```

## URLSession with Async/Await
Prefer `data(from:)` or `data(for:)` over closure-based data tasks.

## Migration Strategy
Start by converting the leaf functions (lowest level) to `async`, then work your way up. Use `withCheckedContinuation` to bridge legacy closure-based APIs.

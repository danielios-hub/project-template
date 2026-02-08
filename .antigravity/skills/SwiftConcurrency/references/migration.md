# Migration to Swift 6 and Strict Concurrency

## Why Migrate?
Swift 6 provides compile-time guarantees for data-race safety, leading to more stable and crash-free apps.

## Key Build Settings
- **Strict Concurrency Checking**: `minimal` -> `targeted` -> `complete`.
- **Upcoming Features**: Enable features like `RegionBasedIsolation` incrementally.

## Six Migration Habits
1. **Don't Panic**: Migrate in iterations.
2. **Sendable by Default**: Use Sendable for all new code.
3. **Minimize Blast Radius**: Small, reviewable PRs.
4. **Resist Over-Refactoring**: Fix the concurrency errors first.

## Step-by-Step Process
1. Enable `targeted` concurrency checking.
2. Fix leaf modules/packages first.
3. Add `@preconcurrency` to legacy imports.
4. Convert closure-based APIs to `async` using `withCheckedContinuation`.
5. Switch to Swift 6 mode when all warnings are resolved.

## Anti-Patterns to Avoid
- ❌ Don't `@MainActor` everything; fix the data isolation.
- ❌ Avoid `Task.sleep` for debouncing; use dedicated timers/sequences.
- ❌ Don't use `nonisolated(unsafe)` without a documented safety invariant.

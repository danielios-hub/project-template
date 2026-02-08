# Testing Concurrent Code

## Recommendation: Use Swift Testing
Swift Testing is the new standard, built from the ground up for concurrency.

```swift
@Test func testAsyncWork() async throws {
    let result = await api.fetchData()
    #expect(result != nil)
}
```

## Awaiting Callbacks
Use `Continuations` or Swift Testing `Confirmations` to test code that uses callbacks.

## Handling Flaky Tests
Concurrency tests can be unstable due to timing.
- **Swift Concurrency Extras**: Useful for making async tests deterministic.
- **Serial Execution**: Sometimes required for tests that share global state.

## XCTest Patterns (Legacy)
Use `await fulfillment(of: [expectation])` if still using XCTest.

## Best Practices
- Test both success and failure (cancellation/errors) paths.
- Verify deallocation in `deinit` where applicable.
- Avoid manual `Task.sleep` in tests; use dependency injection to control time.

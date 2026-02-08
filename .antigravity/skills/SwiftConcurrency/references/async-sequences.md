# Async Sequences and Streams

## AsyncSequence
A protocol that allows you to iterate over a values that arrive asynchronously.

```swift
for await line in url.lines {
    print(line)
}
```

## AsyncStream
A safe way to create your own `AsyncSequence`.
- **AsyncStream**: For non-throwing streams.
- **AsyncThrowingStream**: For streams that can error.

## Bridging Closures to Streams
Use `AsyncStream` to wrap legacy APIs that provide multiple values via a closure or delegate.

## Stream Lifecycle
- **onTermination**: Called when the stream is finished or cancelled. Useful for cleanup.
- **Yielding**: Use matching `yield(_:)` to send values and `finish()` to close.

## Buffer Policies
- `.unbounded`: Default. Stores all values.
- `.bufferingNewest(n)`: Keeps only the last N values.
- `.bufferingOldest(n)`: Keeps the first N values.

## When to Use
- **AsyncSequence**: When the data comes from a standard source (URLSession, Notifications).
- **AsyncStream**: When you are building a custom data producer or bridging legacy code.
- **AsyncAlgorithms**: Use for complex operations like `debounce`, `throttle`, or `combineLatest` on async sequences.

# SwiftUI Performance Patterns Reference

## Performance Optimization

### 1. Avoid Redundant State Updates
SwiftUI triggers updates even if value is unchanged. Check before assigning:

```swift
if self.currentValue != value {
    self.currentValue = value
}
```

### 2. Optimize Hot Paths
Only update state when a threshold is crossed (e.g., in scroll handlers).

### 3. Pass Only What Views Need
Avoid passing large "config" or "context" objects. Narrow the scope of dependencies.

### 4. Use Equatable Views
Conform to `Equatable` for expensive bodies to gain more control over invalidation.

### 5. POD Views for Fast Diffing
Plain Old Data views (let-only, no wrappers) are fastest to diff.

### 6. Lazy Loading
Use `LazyVStack` and `LazyHStack` for scrolling containers.

### 7. Task Cancellation
Use the `.task` modifier for automatic cancellation on disappear.

### 8. Debug View Updates
Use `Self._printChanges()` to identify what's causing re-renders.

## Anti-Patterns

### 1. Creating Objects in Body
Avoid creating `DateFormatter` or `JSONDecoder` inside the `body`. Use static or stored instances.

### 2. Heavy Computation in Body
Keep `body` pure and simple. Move sorting or filtering to the ViewModel or use `@State` to cache results.

### 3. Unnecessary State
Don't store derived values as separate `@State`. Use computed properties instead.

## Summary Checklist
- [x] No redundant state updates
- [x] Narrow dependency scope
- [x] Using lazy containers
- [x] No object creation in `body`
- [x] Heavy work removed from `body`

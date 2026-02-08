# SwiftUI View Structure Reference

## View Structure Principles
SwiftUI's diffing algorithm compares view hierarchies to determine what needs updating. Proper view composition directly impacts performance.

## Prefer Modifiers Over Conditional Views
**Prefer "no-effect" modifiers over conditionally including views.**

```swift
// Good - same view, different states
SomeView()
    .opacity(isVisible ? 1 : 0)

// Avoid - creates/destroys view identity
if isVisible {
    SomeView()
}
```

**Why**: Conditional inclusion can cause loss of state and poor animation performance.

## Extract Subviews, Not Computed Properties
**Extract to separate `struct` views.** SwiftUI can skip their `body` when inputs don't change.

```swift
// GOOD - ComplexSection body SKIPPED when its inputs don't change
struct ParentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            Button("Tap: \(count)") { count += 1 }
            ComplexSection()  // Body skipped during re-evaluation
        }
    }
}
```

**Why**: `@ViewBuilder` functions or computed properties re-execute on every parent state change.

## Container View Pattern
Avoid closure-based content if you need SwiftUI to compare and skip updates. Use `@ViewBuilder let content: Content` instead.

## ZStack vs overlay/background
- Use `ZStack` for peer views that joints define layout.
- Use `overlay`/`background` for decoration of a primary view.

## Summary Checklist
- [x] Prefer modifiers over conditionals
- [x] Extract subviews to separate structs
- [x] Keep views small and focused
- [x] Use `@ViewBuilder let content: Content` for containers

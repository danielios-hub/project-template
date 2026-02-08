# SwiftUI Layout Best Practices Reference

## Relative Layout Over Constants
**Use dynamic layout calculations instead of hard-coded values.**

```swift
// Good - adapts to given space
GeometryReader { geometry in
    HeaderView()
        .frame(height: geometry.size.height * 0.2)
}
```

## Context-Agnostic Views
**Views should work in any context.** Don't assume full screen or specific presentation styles.

## Own Your Container
Custom views should own their internal layout containers (like `HStack` / `VStack`) but leave lazy/repeatable containers to the caller.

## Layout Performance
- Minimize deep hierarchies.
- Avoid excessive `GeometryReader` usage.
- Gate frequent geometry updates by thresholds.

## View Logic and Testability
Separate view logic into testable models (using `@Observable` on iOS 17+).

## Action Handlers
View body should reference action methods, not contain complex inline logic.

## Summary Checklist
- [x] Relative layout over magic numbers
- [x] Context-agnostic view design
- [x] Flatter view hierarchies
- [x] Logic separated from layout

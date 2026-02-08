---
name: swiftui-expert-skill
description: Write, review, or improve SwiftUI code following best practices for state management, view composition, performance, modern APIs, Swift concurrency, and iOS 26+ Liquid Glass adoption. Use when building new SwiftUI features, refactoring existing views, reviewing code quality, or adopting modern SwiftUI patterns.
---

# SwiftUI Expert Skill

Use this skill to build, review, or improve SwiftUI features with correct state management, modern API usage, Swift concurrency best practices, optimal view composition, and iOS 26+ Liquid Glass styling. Prioritize native APIs, Apple design guidance, and performance-conscious patterns.

## Workflow Decision Tree

### 1) Review existing SwiftUI code
- Check property wrapper usage against the selection guide
- Verify modern API usage
- Verify view composition follows extraction rules
- Check performance patterns are applied
- Verify list patterns use stable identity
- Check animation patterns for correctness
- Inspect Liquid Glass usage for correctness and consistency
- Validate iOS 26+ availability handling with sensible fallbacks

### 2) Improve existing SwiftUI code
- Audit state management for correct wrapper selection (prefer `@Observable` over `ObservableObject`)
- Replace deprecated APIs with modern equivalents
- Extract complex views into separate subviews
- Refactor hot paths to minimize redundant state updates
- Ensure ForEach uses stable identity
- Improve animation patterns (use value parameter, proper transitions)
- Suggest image downsampling when `UIImage(data:)` is used
- Adopt Liquid Glass only when explicitly requested by the user

### 3) Implement new SwiftUI feature
- Design data flow first: identify owned vs injected state
- Use modern APIs (no deprecated modifiers or patterns)
- Use `@Observable` for shared state (with `@MainActor` if not using default actor isolation)
- Structure views for optimal diffing (extract subviews early, keep views small)
- Separate business logic into testable models
- Use correct animation patterns (implicit vs explicit, transitions)
- Apply glass effects after layout/appearance modifiers
- Gate iOS 26+ features with `#available` and provide fallbacks

## Core Guidelines

### State Management
- **Always prefer `@Observable` over `ObservableObject`** for new code
- **Mark `@Observable` classes with `@MainActor`** unless using default actor isolation
- **Always mark `@State` and `@StateObject` as `private`**
- **Never declare passed values as `@State` or `@StateObject`**
- Use `@State` with `@Observable` classes (not `@StateObject`)
- `@Binding` only when child needs to **modify** parent state
- `@Bindable` for injected `@Observable` objects needing bindings
- Use `let` for read-only values; `var` + `.onChange()` for reactive reads

### Modern APIs
- Use `foregroundStyle()` instead of `foregroundColor()`
- Use `clipShape(.rect(cornerRadius:))` instead of `cornerRadius()`
- Use `Tab` API instead of `tabItem()`
- Use `Button` instead of `onTapGesture()` (unless need location/count)
- Use `NavigationStack` instead of `NavigationView`
- Use `navigationDestination(for:)` for type-safe navigation
- Use two-parameter or no-parameter `onChange()` variant
- Use `ImageRenderer` for rendering SwiftUI views
- Use `.sheet(item:)` instead of `.sheet(isPresented:)` for model-based content
- Sheets should own their actions and call `dismiss()` internally

### Performance
- Pass only needed values to views (avoid large "config" objects)
- Eliminate unnecessary dependencies to reduce update fan-out
- Check for value changes before assigning state in hot paths
- Avoid redundant state updates in `onReceive`, `onChange`, scroll handlers
- Use `LazyVStack`/`LazyHStack` for large lists
- Use stable identity for `ForEach` (never `.indices` for dynamic content)
- Avoid `AnyView` in list rows

### Animations
- Use `.animation(_:value:)` with value parameter
- Use `withAnimation` for event-driven animations
- Prefer transforms (`offset`, `scale`, `rotation`) over layout changes (`frame`)
- Use `.phaseAnimator` or `.keyframeAnimator` for complex sequences (iOS 17+)

## Quick Reference

### Property Wrapper Selection (Modern)
| Wrapper | Use When |
|---------|----------|
| `@State` | Internal view state (must be `private`), or owned `@Observable` class |
| `@Binding` | Child modifies parent's state |
| `@Bindable` | Injected `@Observable` needing bindings |
| `let` | Read-only value from parent |
| `var` | Read-only value watched via `.onChange()` |

### Modern API Replacements
| Deprecated | Modern Alternative |
|------------|-------------------|
| `foregroundColor()` | `foregroundStyle()` |
| `cornerRadius()` | `clipShape(.rect(cornerRadius:))` |
| `tabItem()` | `Tab` API |
| `onTapGesture()` | `Button` |
| `NavigationView` | `NavigationStack` |
| `onChange(of:) { value in }` | `onChange(of:) { old, new in }` |
| `GeometryReader` | `containerRelativeFrame()` or `visualEffect()` |
| `String(format: "%.2f", value)` | `Text(value, format: .number.precision(.fractionLength(2)))` |

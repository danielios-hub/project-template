# SwiftUI State Management Reference

## Property Wrapper Selection Guide
| Wrapper | Use When | Notes |
|---------|----------|-------|
| `@State` | Internal view state that triggers updates | Must be `private` |
| `@Binding` | Child view needs to modify parent's state | Don't use for read-only |
| `@Bindable` | iOS 17+: View receives `@Observable` object and needs bindings | For injected observables |
| `let` | Read-only value passed from parent | Simplest option |
| `var` | Read-only value that child observes via `.onChange()` | For reactive reads |

**Legacy (Pre-iOS 17):**
| Wrapper | Use When | Notes |
|---------|----------|-------|
| `@StateObject` | View owns an `ObservableObject` instance | Use `@State` with `@Observable` instead |
| `@ObservedObject` | View receives an `ObservableObject` from outside | Never create inline |

## @State
Always mark `@State` properties as `private`. Use for internal view state that triggers UI updates.

```swift
// Correct
@State private var isAnimating = false
@State private var selectedTab = 0
```

**Why Private?** Marking state as `private` makes it clear what's created by the view versus what's passed in. It also prevents accidentally passing initial values that will be ignored.

### iOS 17+ with @Observable (Preferred)
**Always prefer `@Observable` over `ObservableObject`.** With iOS 17's `@Observable` macro, use `@State` instead of `@StateObject`:

```swift
@Observable
@MainActor  // Always mark @Observable classes with @MainActor
final class DataModel {
    var name = "Some Name"
    var count = 0
}

struct MyView: View {
    @State private var model = DataModel()  // Use @State, not @StateObject

    var body: some View {
        VStack {
            TextField("Name", text: $model.name)
            Stepper("Count: \(model.count)", value: $model.count)
        }
    }
}
```

## @Binding
Use only when child view needs to **modify** parent's state. If child only reads the value, use `let` instead.

```swift
// Parent
struct ParentView: View {
    @State private var isSelected = false

    var body: some View {
        ChildView(isSelected: $isSelected)
    }
}

// Child - will modify the value
struct ChildView: View {
    @Binding var isSelected: Bool

    var body: some View {
        Button("Toggle") {
            isSelected.toggle()
        }
    }
}
```

### When NOT to use @Binding
```swift
// Bad - child only displays, doesn't modify
struct DisplayView: View {
    @Binding var title: String  // Unnecessary
    var body: some View {
        Text(title)
    }
}

// Good - use let for read-only
struct DisplayView: View {
    let title: String
    var body: some View {
        Text(title)
    }
}
```

## @StateObject vs @ObservedObject (Legacy - Pre-iOS 17)
**Note**: These are legacy patterns. Always prefer `@Observable` with `@State` for iOS 17+.

The key distinction is **ownership**:
- `@StateObject`: View **creates and owns** the object
- `@ObservedObject`: View **receives** the object from outside

## Don't Pass Values as @State
**Critical**: Never declare passed values as `@State` or `@StateObject`. The value you provide is only an initial value and won't update.

## @Bindable (iOS 17+)
Use when receiving an `@Observable` object from outside and needing bindings.

## Environment and Preferences
### @Environment
Access environment values provided by SwiftUI or parent views.

### @Environment with @Observable (iOS 17+ - Preferred)
**Always prefer this pattern** for sharing state through the environment.

## Decision Flowchart
(See SKILL.md for the summary flowchart)

## Key Principles
1. **Always prefer `@Observable` over `ObservableObject`** for new code
2. **Mark `@Observable` classes with `@MainActor` for thread safety**
3. Use `@State` with `@Observable` classes (not `@StateObject`)
4. Use `@Bindable` for injected `@Observable` objects that need bindings
5. **Always mark `@State` and `@StateObject` as `private`**
6. **Never declare passed values as `@State` or `@StateObject`**
7. With `@Observable`, nested objects work fine; with `ObservableObject`, pass nested objects directly to child views

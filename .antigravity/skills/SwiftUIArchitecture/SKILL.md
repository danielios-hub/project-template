---
name: SwiftUI Architecture
description: Patterns and rules for building UI in Captain's Log using SwiftUI, MVVM-C, and @Observable.
---

# SwiftUI Architecture Skill

This skill guides the implementation of UI components following the project's established modular architecture.

## Principles

- **State Management**: Always use `@Observable` for ViewModels and State classes. Avoid the deprecated `ObservableObject`.
- **Navigation (MVVM-C)**: Use the `AppRouter` for navigation. Each feature should have a `Coordinator`.
- **View Building**:
    - Prefer `@ViewBuilder` and `some View` over `AnyView`.
    - Views should be as thin as possible, delegating logic to ViewModels.
- **Dependency Injection**: Use `@Dependency` from `swift-dependencies` for services and repositories.

## Example Pattern

```swift
@Observable
final class ExampleViewModel {
    var title: String = "Hello"
    
    @ObservationIgnored
    @Dependency(\.someService) var someService
}

struct ExampleView: View {
    @Bindable var viewModel: ExampleViewModel
    
    var body: some View {
        Text(viewModel.title)
    }
}
```

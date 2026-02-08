# Project Rules: Captain's Log

## Architecture
- **Modular Design**: The project is split into local Swift Packages under `CaptainsLog/Packages/`.
  - `Core`: Shared models, navigation logic, and dependencies.
  - `Journal`, `News`, `More`, `Editor`: Feature modules.
- **Navigation (MVVM-C / Router)**:
  - `AppRouter` (in `Core`) is the source of truth for navigation.
  - Feature-specific routes are defined in `Core` (e.g., `JournalRoute`) to allow cross-module navigation.
  - Each feature has a `Coordinator` (e.g., `JournalCoordinator`) that manages its own `NavigationStack`.
- **Dependency Injection**: Use `swift-dependencies` for all shared services, repositories, and use cases.
- **Data Layer**: Use `SwiftData` for persistence, managed through `SwiftDataContainer` in `Core`.

## Coding Style
- **No File Headers**: Do not include Xcode's default header comments (e.g., // Created by...).
- **State Management**: Use `@Observable` for ViewModels and State objects.
- **View Building**:
  - Prefer `@ViewBuilder` and `some View` over `AnyView` whenever possible.
  - Use `Coordinator` patterns to decouple view logic from navigation setup.
- **Clean Code**:
  - Use extensions to group related functionality (e.g., `AppRouter` navigation methods).
  - Keep `ViewModel` logic focused on UI state and orchestration.

## Git & Filesystem
- **SPM Resolving**: 
  - Track `CaptainsLog.xcodeproj/project.xcworkspace/xcshareddata/swiftpm/Package.resolved`.
  - Ignore local package versions via `.gitignore` rule: `**/Packages/**/*.resolved`.
- **Naming**: Use descriptive names reflecting the module and purpose (e.g., `JournalViewModel`, `NewsCoordinator`).

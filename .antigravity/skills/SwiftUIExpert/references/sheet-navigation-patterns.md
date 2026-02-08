# SwiftUI Sheet and Navigation Patterns Reference

## Sheet Patterns

### Item-Driven Sheets (Preferred)
**Use `.sheet(item:)` instead of `.sheet(isPresented:)` when presenting model-based content.**
It automatically handles state and avoids optional unwrapping in the sheet.

### Sheets Own Their Actions
Sheets should handle their own dismiss and internal logic (save/cancel) rather than relying on parent closures.

## Navigation Patterns

### Type-Safe Navigation with NavigationStack
Use `navigationDestination(for:)` with a Hashable enum or model for clear, type-safe routing.

### Programmatic Navigation
Bind `NavigationStack` to a `NavigationPath` or an array of values for programmatic control.

## Presentation Modifiers
- `.fullScreenCover`
- `.popover` (use `.presentationCompactAdaptation(.popover)` on iPhone)
- `.alert` and `.confirmationDialog` with semantic button roles.

## Summary Checklist
- [x] Item-driven sheets preferred
- [x] Sheets own their dismissal logic
- [x] Type-safe navigation paths used

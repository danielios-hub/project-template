# SwiftUI Transitions Reference

## Property Animations vs Transitions
- **Property animations**: Animate existing views.
- **Transitions**: Animate the insertion or removal of views.

## Basic Transitions
- `.opacity`, `.scale`, `.slide`, `.move(edge:)`.
- **Combined**: `.transition(.slide.combined(with: .opacity))`.

### Critical: Animation Context
Transitions ONLY work if there is an animation context (either `withAnimation` or a surrounding `.animation` modifier).

## Asymmetric Transitions
Use `.asymmetric(insertion:removal:)` for different effects when a view appears vs disappears.

## The Animatable Protocol
For custom animations on types that aren't natively animatable, implement the `Animatable` protocol with `animatableData`.

## Summary Checklist
- [x] Animation context provided for transitions
- [x] Asymmetric transitions used where appropriate
- [x] Avoided `.animation` inside conditional view logic

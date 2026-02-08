# SwiftUI Advanced Animations

## Transactions
The underlying mechanism for all animations. Implicit animations override explicit ones.
- **Precedence**: Later in the view tree wins.
- **Disabling**: `.transaction { $0.disablesAnimations = true }`.

## Phase Animations (iOS 17+)
Cycle through discrete phases automatically. Recommended for multi-step sequences.
Use **Enum Phases** for clarity.

## Keyframe Animations (iOS 17+)
Precise timing control for complex, multi-track animations.

## Animation Completion Handlers (iOS 17+)
Use `withAnimation(completion:)` or `.transaction(value:completion:)` to react when an animation finishes.

## Summary Checklist
- [x] Using Phases/Keyframes for multi-step animations on iOS 17+
- [x] Transaction metadata used for complex logic
- [x] Correct animation precedence handled

# SwiftUI Animation Basics

## Core Concepts
Animations are additive, cancelable, and interpolated at high frame rates.

## Implicit Animations
Use `.animation(_:value:)` to animate when a specific value changes.
**Avoid** the deprecated version without the `value` parameter.

## Explicit Animations
Use `withAnimation` for event-driven changes like button taps.

## Animation Placement
Place the `.animation` modifier AFTER the properties you want it to affect.

## Selective Animation
Animate only specific properties by chaining multiple modifiers or using the iOS 17+ scoped animation syntax.

## Timing Curves
- `.spring`: Recommended for most interactive UI.
- `.easeInOut`: Good for fading elements.
- `.linear`: Only for progress indicators.

## Animation Performance
- **Prefer Transforms**: `scaleEffect`, `offset`, `rotationEffect` are GPU accelerated.
- **Avoid Layout Changes**: Animating `frame` or `padding` is expensive.
- **Narrow Scope**: Scope animations to specific subviews rather than the whole container.

## Summary Checklist
- [x] Using `.animation(_:value:)`
- [x] Correct modifier placement
- [x] GPU-accelerated transforms preferred
- [x] Scoped animation for performance

# SwiftUI Liquid Glass Reference (iOS 26+)

## Overview
Liquid Glass provides translucent, dynamic surfaces that respond to content and user interaction.

## Availability
**Required**: iOS 26+. Always provide a fallback (e.g., using `.ultraThinMaterial`).

## Core APIs
### glassEffect Modifier
`.glassEffect(_ style:in:)` applies glass effects.
- **Styles**: `.regular`, `.prominent`.
- **Interactivity**: Use `.interactive()` for tappable elements.
- **Tinting**: Add color with `.tint()`.

### GlassEffectContainer
Wraps multiple glass elements for proper visual grouping and spacing.

## Glass Button Styles
Use `.buttonStyle(.glassProminent)` for native glass buttons.

## Modifier Order
Apply `.glassEffect()` AFTER layout and appearance modifiers but BEFORE interaction modifiers like `.interactive()`.

## Summary Checklist
- [x] iOS 26+ availability check with material fallback
- [x] `.glassEffect()` applied after layout modifiers
- [x] `.interactive()` only on interactable elements
- [x] `GlassEffectContainer` used for grouping

# Modern SwiftUI APIs Reference

## Styling and Appearance

### foregroundStyle() vs foregroundColor()
**Always use `foregroundStyle()` instead of `foregroundColor()`.**

```swift
// Modern (Correct)
Text("Hello")
    .foregroundStyle(.primary)

Image(systemName: "star")
    .foregroundStyle(.blue)
```

### clipShape() vs cornerRadius()
**Always use `clipShape(.rect(cornerRadius:))` instead of `cornerRadius()`.**

```swift
// Modern (Correct)
Image("photo")
    .clipShape(.rect(cornerRadius: 12))
```

### fontWeight() vs bold()
Always use `bold()` for standard bold text.

## Navigation
### NavigationStack vs NavigationView
**Always use `NavigationStack` instead of `NavigationView`.**

### navigationDestination(for:)
Use for type-safe navigation.

## Tabs
For iOS 18+, prefer the `Tab` API over `tabItem()`. Use `Tab { } label: { }` for custom labels.

## Interactions
### Button vs onTapGesture()
**Never use `onTapGesture()` unless you specifically need tap location or count. Always use `Button` otherwise.**

### Button with Images
**Always specify text labels for images in buttons for accessibility.**

## Layout and Sizing
Avoid `UIScreen.main.bounds` and `GeometryReader` when modern alternatives like `containerRelativeFrame()` exist.

## Summary Checklist
- [x] Using `foregroundStyle()`
- [x] Using `clipShape()`
- [x] Using `NavigationStack`
- [x] Using `Button` for primary interactions
- [x] Accessibility labels on image buttons

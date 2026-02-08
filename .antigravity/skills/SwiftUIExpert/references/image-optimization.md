# SwiftUI Image Optimization Reference

## AsyncImage Best Practices
**Always handle phases** (`.empty`, `.success`, `.failure`) to provide a good user experience during loading or errors.

### AsyncImage with Transition
Add a transition to the success phase to avoid abrupt image appearances.

## Image Decoding and Downsampling
When using `UIImage(data:)`, images are decoded on the main thread. For large images in lists or grids, consider **downsampling** off the main thread.

### Reusable Downsampling Actor
Using `CGImageSource` to create thumbnails at specific sizes can significantly reduce memory usage and improve scroll performance.

**Note**: This is an optional optimization for performance-sensitive contexts.

## SF Symbols
Use `systemName` with rendering modes (`.multicolor`, `.hierarchical`) and symbols effects like `.variableColor` (iOS 17+).

## ImageRenderer (iOS 16+)
Use `ImageRenderer` to capture SwiftUI views as `UIImage` or `CGImage` for sharing or saving.

## Summary Checklist
- [x] AsyncImage handles all phases
- [x] Transitions used for smooth appearance
- [x] Downsampling considered for large images in lists
- [x] Off-main-thread image processing where needed
- [x] Using modern SF Symbol features

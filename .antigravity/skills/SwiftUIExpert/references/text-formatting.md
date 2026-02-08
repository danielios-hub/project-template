# SwiftUI Text Formatting Reference

## Modern Text Formatting
**Never use `String(format:)` with Text.** Always use the `format` parameter which is locale-aware and safer.

## Number Formatting
Use `.number.precision()` for decimal control and grouping.

## Currency and Percentage
Native formatters handle localization and symbols automatically.

## Date and Time
Use `.dateTime` or `.relative` for dynamic, localized date strings.

## String Searching and Comparison
Use `localizedStandardContains()` for user-input filtering to handle case/diacritic sensitivity correctly.

## Attributed Strings
SwiftUI Text natively supports `AttributedString` and Markdown for styling parts of a string.

## Summary Checklist
- [x] No `String(format:)` in `Text` views
- [x] Using native formatters for numbers/dates
- [x] `localizedStandardContains()` for search
- [x] Markdown used for simple styling

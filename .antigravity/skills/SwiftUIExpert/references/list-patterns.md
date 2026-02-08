# SwiftUI List Patterns Reference

## ForEach Identity and Stability

**Always provide stable identity for `ForEach`.** Never use `.indices` for dynamic content.

```swift
// Good - stable identity via Identifiable
extension User: Identifiable {
    var id: String { userId }
}

ForEach(users) { user in
    UserRow(user: user)
}

// Good - stable identity via keypath
ForEach(users, id: \.userId) { user in
    UserRow(user: user)
}

// Wrong - indices create static content
ForEach(users.indices, id: \.self) { index in
    UserRow(users[index])  // Can crash on removal!
}
```

**Critical**: Ensure **constant number of views per element** in `ForEach`.

**Avoid inline filtering:**
Prefilter and cache results in a ViewModel or State property instead of filtering directly in the `ForEach`.

**Avoid `AnyView` in list rows.**

## Enumerated Sequences
Always convert enumerated sequences to arrays to be used in a `ForEach`.

## List with Custom Styling
How to remove default backgrounds and separators for a custom look.

## Summary Checklist
- [x] ForEach uses stable identity
- [x] Constant number of views per element
- [x] No inline filtering
- [x] No `AnyView` in list rows

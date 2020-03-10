# Extensible

Kotlin standard extension functions for Swift!

This library is inspired by Kotlin standard extension functions and [Then](https://github.com/devxoul/Then).

## Example
```swift
let widthOrNil = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
    .also { print("width: \($0.width)") }
    .takeIf { $0.width > 50 }?
    .let { $0.width }
print(widthOrNil ?? "nil")
```

## License
Extensible is available under the MIT license. See the LICENSE file for more info.

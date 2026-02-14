import SwiftUI
import UIKit

// MARK: - Default Colors

public struct DefaultColorPalette: ColorPalette {
    public var primary: Color = Color.blue
    public var secondary: Color = Color.purple
    public var background: Color = Color(UIColor.systemBackground) // Semantic system color
    public var surface: Color = Color(UIColor.secondarySystemBackground) // Semantic system color
    public var text: Color = Color.primary
    public var textSecondary: Color = Color.secondary
    public var accent: Color = Color.orange
    public var error: Color = Color.red
    public var success: Color = Color.green
    
    public init() {}
}

// MARK: - Default Typography

public struct DefaultTypography: Typography {
    public var large: Font = .system(size: 32, weight: .bold, design: .rounded)
    public var medium: Font = .system(size: 24, weight: .semibold, design: .rounded)
    public var small: Font = .system(size: 20, weight: .semibold, design: .rounded)
    public var body: Font = .body
    public var bodyBold: Font = .body.weight(.bold)
    public var caption: Font = .caption
    public var button: Font = .headline
    
    public init() {}
}

// MARK: - Default Theme

public struct DefaultTheme: Theme {
    public var colors: ColorPalette = DefaultColorPalette()
    public var typography: Typography = DefaultTypography()
    
    public init() {}
}

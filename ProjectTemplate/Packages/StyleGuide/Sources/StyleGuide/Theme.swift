import SwiftUI

// MARK: - Color Palette

public protocol ColorPalette: Sendable {
    var primary: Color { get }
    var secondary: Color { get }
    var background: Color { get }
    var surface: Color { get }
    var text: Color { get }
    var textSecondary: Color { get }
    var accent: Color { get }
    var error: Color { get }
    var success: Color { get }
}

// MARK: - Typography

public protocol Typography: Sendable {
    var h1: Font { get }
    var h2: Font { get }
    var h3: Font { get }
    var body: Font { get }
    var bodyBold: Font { get }
    var caption: Font { get }
    var button: Font { get }
}

// MARK: - Theme

public protocol Theme: Sendable {
    var colors: ColorPalette { get }
    var typography: Typography { get }
}

// MARK: - Environment

private struct ThemeKey: EnvironmentKey {
    static let defaultValue: Theme = DefaultTheme()
}

public extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

public extension View {
    func theme(_ theme: Theme) -> some View {
        environment(\.theme, theme)
    }
}

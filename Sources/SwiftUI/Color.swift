import SwiftUI
#if canImport(AppKit)
import AppKit
#elseif canImport(UIKit)
import UIKit
#endif

public extension Color {
    static var label: Color {
#if canImport(AppKit)
        return Color(nsColor: NSColor.labelColor)
#elseif canImport(UIKit)
        return Color(uiColor: UIColor.label)
#endif
    }

    static var background: Color {
#if canImport(AppKit)
        return Color(nsColor: NSColor.textBackgroundColor)
#elseif canImport(UIKit)
        return Color(uiColor: UIColor.systemBackground)
#endif
    }
}

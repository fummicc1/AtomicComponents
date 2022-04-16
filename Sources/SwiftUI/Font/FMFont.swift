import SwiftUI

public enum FMFont {
    case h1
    case h2
    case h3
    case h4
    case body
    case button

    var value: Font {
        switch self {
        case .h1:
            return .largeTitle
        case .h2:
            return .title
        case .h3:
            return .title2
        case .h4:
            return .title3
        case .body:
            return .body
        case .button:
            return .body.bold()
        }
    }
}

public struct FMFontModifier: ViewModifier {

    public init(font: FMFont) {
        self.font = font
    }

    public let font: FMFont

    public func body(content: Content) -> some View {
        content.font(font.value)
    }
}

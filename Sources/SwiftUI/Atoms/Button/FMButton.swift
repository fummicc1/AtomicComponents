import SwiftUI
import Combine

public struct FMButton: View {

    public init(
        title: String,
        padding: EdgeInsets = .init(top: 8, leading: 12, bottom: 8, trailing: 12),
        foregroundColor: Color = Color(uiColor: UIColor.label),
        backgroundColor: Color = Color(uiColor: UIColor.systemBackground),
        cornerRadius: CGFloat = 12,
        shadowRadius: CGFloat? = nil,
        shadowColor: Color? = nil,
        shadowOffset: CGPoint? = nil,
        onPressed: (() -> Void)? = nil
    ) {
        self.title = title
        self.padding = padding
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffset
        self.onPressed = onPressed
    }


    public var title: String
    public var padding: EdgeInsets
    public var foregroundColor: Color
    public var backgroundColor: Color
    public var cornerRadius: CGFloat
    public var shadowRadius: CGFloat?
    public var shadowColor: Color?
    public var shadowOffset: CGPoint?

    private var onPressed: (() -> Void)?

    public var body: some View {

        var root = Button {
            onPressed?()
        } label: {
            Text(title)
                .modifier(FMFontModifier(font: .button))
                .foregroundColor(foregroundColor)
        }
        .padding(padding)
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
        .eraseToAnyView

        if let shadowRadius = shadowRadius {
            if let shadowColor = shadowColor, let shadowOffset = shadowOffset {
                root = root.shadow(
                    color: shadowColor,
                    radius: shadowRadius,
                    x: shadowOffset.x,
                    y: shadowOffset.y
                ).eraseToAnyView
            }
        }
        return root
    }
}

public extension FMButton {
    mutating func onPressed(_ onPressed: @escaping () -> Void) -> Self {
        self.onPressed = onPressed
        return self
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FMButton(title: "Hello World!")
            .previewLayout(.sizeThatFits)
    }
}

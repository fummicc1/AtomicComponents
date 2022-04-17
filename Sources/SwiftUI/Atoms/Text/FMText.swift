import SwiftUI

public struct FMText: View {

    public init(
        text: Binding<String>,
        font: FMFont,
        padding: EdgeInsets = .init(
            top: 8,
            leading: 12,
            bottom: 8,
            trailing: 12
        )
    ) {
        self._text = text
        self.font = font
        self.padding = padding
    }


    @Binding public var text: String
    public var font: FMFont
    public var padding: EdgeInsets

    public var body: some View {
        Text(text)
            .modifier(FMFontModifier(font: font))
            .padding(padding)
    }
}

struct FMText_Previews: PreviewProvider {
    static var previews: some View {
        FMText(
            text: .constant("Hello World"),
            font: .h1
        )
        .previewLayout(.sizeThatFits)
    }
}

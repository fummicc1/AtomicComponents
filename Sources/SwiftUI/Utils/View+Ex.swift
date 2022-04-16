import SwiftUI

public extension View {
    var eraseToAnyView: AnyView {
        AnyView(self)
    }
}

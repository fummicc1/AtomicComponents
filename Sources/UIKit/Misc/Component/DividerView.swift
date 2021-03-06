import Foundation
import UIKit

public class DividerView: UIView {
    public init(
        length: CGFloat,
        axis: DividerView.Axis
    ) {
        self.length = length
        self.axis = axis
        super.init(frame: .zero)
        backgroundColor = UIColor.separator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var length: CGFloat
    public var axis: Axis

    public override var intrinsicContentSize: CGSize {
        if axis == .horizontal {
            return CGSize(width: length, height: 2)
        } else {
            return CGSize(width: 2, height: length)
        }
    }
}

public extension DividerView {
    enum Axis {
        case vertical
        case horizontal
    }
}

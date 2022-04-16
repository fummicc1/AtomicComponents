import Foundation
import UIKit

class ColoredSwitch: UISwitch {

    override init(frame: CGRect) {
        super.init(frame: frame)
        updateColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateColor()
    }
    
    func updateColor(tintColor: UIColor = .tintColor) {
        onTintColor = tintColor
        setNeedsDisplay()
    }
}

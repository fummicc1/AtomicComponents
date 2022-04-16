import Foundation
import UIKit

class BarButtonItem: UIBarButtonItem {
    
    override init() {
        super.init()
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        tintColor = AppColor.backgroundColor
    }
    
}

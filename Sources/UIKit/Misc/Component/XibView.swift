import Foundation
import UIKit

class XibView: UIView {

    class var nibName: String {
        return String(describing: self)
    }

    @IBOutlet var _view: UIView! {
        didSet {
            _view.frame = bounds
            addSubview(_view)
            _view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }
    
    func commonInit() {
        UINib(nibName: type(of: self).nibName, bundle: nil)
            .instantiate(withOwner: self, options: nil)
    }
}

import Foundation
import SnapKit
import UIKit

class MessageView: XibView {
    
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var stackView: UIStackView!
    
    var text: String = "" {
        didSet {
            errorLabel.text = text
        }
    }
    
    init(frame: CGRect, text: String) {
        super.init(frame: frame)
        self.text = text
        errorLabel.text = text
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func commonInit() {
        super.commonInit()
        stackView.layer.cornerRadius = 8
        stackView.layer.masksToBounds = true
        
        errorLabel.textColor = AppColor.mainColor
        
        layer.masksToBounds = false
        layer.shadowColor = AppColor.mainColor.cgColor
        layer.shadowRadius = 8
        layer.shadowOffset = .init(width: 2, height: 2)
        layer.shadowOpacity = 0.2
        
    }
    
    @IBAction private func tap() {
        hide()
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) { [weak self] in
            guard let self = self else {
                return
            }
            self.snp.updateConstraints { make in
                make.height.equalTo(0)
            }
            self.superview?.layoutIfNeeded()
        }
    }
}

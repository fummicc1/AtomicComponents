import UIKit

class ShadowButton: UIButton, Shadow {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            layer.cornerRadius == 0 ? min(frame.width, frame.height) / 2 : layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            layer.shadowRadius == 0 ? min(frame.width, frame.height) / 2 : layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    init(frame: CGRect, buttonTitle: String?, buttonImage: UIImage?) {
        super.init(frame: frame)
        setTitle(buttonTitle, for: .normal)
        setImage(buttonImage, for: .normal)
        adjustsImageSizeForAccessibilityContentSizeCategory = true
        titleLabel?.adjustsFontForContentSizeCategory = true
        imageView?.adjustsImageSizeForAccessibilityContentSizeCategory = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        adjustsImageSizeForAccessibilityContentSizeCategory = true
        titleLabel?.adjustsFontForContentSizeCategory = true
        imageView?.adjustsImageSizeForAccessibilityContentSizeCategory = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addShadowAndRadius(cornerRadius: cornerRadius, shadowRadius: shadowRadius)
    }
}

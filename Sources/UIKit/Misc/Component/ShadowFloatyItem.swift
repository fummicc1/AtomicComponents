import Foundation
import Floaty

class ShadowFloatyItem: FloatyItem {
    override init() {
        super.init()
        
        buttonColor = AppColor.mainColor
        iconTintColor = AppColor.backgroundColor
        titleShadowColor = AppColor.shadowColor
        circleShadowColor = AppColor.shadowColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

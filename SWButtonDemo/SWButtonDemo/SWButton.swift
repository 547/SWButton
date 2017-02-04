//
//  自定义按钮
//  SWButtonDemo
//
//  Created by SevenWang on 2017/2/4.
//  Copyright © 2017年 SevenWang. All rights reserved.
//

import UIKit

public class SWButton: UIButton {
    public var path:UIBezierPath? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:绘制按钮时添加path遮罩
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        let shapLayer = CAShapeLayer.init(layer: self.layer)
        shapLayer.path = self.path?.cgPath
        self.layer.mask = shapLayer
    }
    
    //MARK:覆盖方法，点击时判断点是否在path内，YES则响应，NO则不响应
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let res = super.point(inside: point, with: event)
        if res {
            if (self.path?.contains(point))! {
                return true
            }
            return false
        }
        return false
    }
}

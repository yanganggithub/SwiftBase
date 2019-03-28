//
//  HorizontalButton.swift
//  shop
//
//  Created by mac on 2019/2/2.
//  Copyright © 2019年 hw. All rights reserved.
//

import UIKit

class HorizontalButton: UIButton {

    open var gap: CGFloat = 5
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        guard let imageView = imageView, let titleLabel = titleLabel else { return }
        
        let marginLeft = (self.frame.size.width - imageView.frame.size.width - titleLabel.frame.size.width - gap) / 2
      
        var newFrame = titleLabel.frame
        newFrame.origin.x = marginLeft
        titleLabel.frame = newFrame
        
        var frame = imageView.frame
        frame.origin.x = titleLabel.frame.origin.x + titleLabel.frame.size.width + 5
        imageView.frame = frame
      
    }
}

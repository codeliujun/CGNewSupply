//
//  CGButton.swift
//  CGSupply
//
//  Created by liujun on 15/9/21.
//  Copyright © 2015年 liujun. All rights reserved.
//

import UIKit

class CGButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
        
    }

}

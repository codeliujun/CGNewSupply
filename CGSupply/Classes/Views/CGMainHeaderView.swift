//
//  CGMainHeaderView.swift
//  CGSupply
//
//  Created by liujun on 15/9/21.
//  Copyright © 2015年 liujun. All rights reserved.
//

import UIKit

enum SupplyOrderStatus : Int{
    
    case willSendOrder
    case didSendOrder
    case errorOrder
    
}

class CGMainHeaderView: CGBaseView {

    var orderStatus : SupplyOrderStatus! = SupplyOrderStatus.willSendOrder
    
    
    @IBOutlet var labels: [UILabel]!
    
    @IBOutlet var views: [UIView]!
    
    @IBOutlet var buttons: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let label = labels[0]
        let view = views[0]
        label.textColor = kThemeColor
        view.backgroundColor = kThemeColor
    }
    
    @IBAction func tapButton(sender: UIButton) {
        
        for (index,value) in EnumerateSequence(buttons) {
            let label = labels[index]
            let view = views[index]
            if value == sender {
                label.textColor = kThemeColor
                view.backgroundColor = kThemeColor
            }else {
                label.textColor = UIColor.blackColor()
                view.backgroundColor = UIColor.whiteColor()
            }
        }
  
    }
}

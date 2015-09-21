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
    
    @IBAction func tapButton(sender: UIButton) {
        
        for (index,value) in EnumerateSequence(buttons) {
            
            if value == sender {
                
            }
            
        }
    }
    
}

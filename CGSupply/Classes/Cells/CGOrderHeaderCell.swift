//
//  CGOrderHeaderCell.swift
//  CGSupply
//
//  Created by 刘俊 on 15/9/29.
//  Copyright © 2015年 liujun. All rights reserved.
//

import UIKit

class CGOrderHeaderCell: UITableViewCell {

    @IBOutlet weak var orderNumber: UILabel!
    
    @IBOutlet weak var shopName: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

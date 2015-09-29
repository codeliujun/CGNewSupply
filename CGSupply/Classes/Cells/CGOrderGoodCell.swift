//
//  CGOrderGoodCell.swift
//  CGSupply
//
//  Created by 刘俊 on 15/9/29.
//  Copyright © 2015年 liujun. All rights reserved.
//

import UIKit

class CGOrderGoodCell: UITableViewCell {

    
    @IBOutlet weak var iconImageView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var totalPriceLabel: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

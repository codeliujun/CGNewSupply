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
    
    @IBOutlet weak var addressLabel: UILabel! //status
    
    var dataInfo : NSDictionary!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func layoutContentWithInfo(info:NSDictionary) {
        
        dataInfo = info
        
        if let str = dataInfo["SubscribeNum"] { //订单号
            if  str.isKindOfClass(NSNull.classForCoder()) {
                orderNumber.text = "没有数据"
            }else {
                orderNumber.text = (str as! String)
            }
        }
        
        if let str = dataInfo["UserName"] { //配送门店
            if  str.isKindOfClass(NSNull.classForCoder()) {
                shopName.text = "没有数据"
            }else {
                shopName.text = (str as! String)
            }
        }
        
        if let str = dataInfo["Total"] {
            if  str.isKindOfClass(NSNull.classForCoder()) {
                priceLabel.text = "没有数据"
            }else {
                let price = str as! Double
                priceLabel.text = NSString(format: "￥%.2f",price) as String
            }
        }
        
        if let str = dataInfo["StateStr"] { //状态
            if  str.isKindOfClass(NSNull.classForCoder()) {
                addressLabel.text = "没有数据"
            }else {
                addressLabel.text = (str as! String)
            }
        }
        
        timeLabel.text = self.getTimeStr()
        
    }
    
    func getTimeStr() -> String {
        
        let time = dataInfo["SubscribeDate"] as! String
        
        let time1 = (time as NSString).substringWithRange(NSMakeRange(6, 10))
        
        //print("===\(time) ====\(time1)")
        
        let timeInteravel = (time1 as NSString).doubleValue
        
        let date = NSDate(timeIntervalSince1970: timeInteravel)
        
        let df = NSDateFormatter()
        df.dateFormat = "YYYY-MM-dd"
        
        return df.stringFromDate(date)
    }

}

/*
{
"ShopJson" : null,
"PurchaseCategory" : null,
"Receive_Address" : null,
"Total" : 2757.92,
"ShopId" : "9dc352d3-7c43-4240-9015-a5210122ba81",
"LeadInformation" : "\/13800",
"SubscribeDateShow" : "2015\/09\/29",
"SubscribeNum" : "S201509294",
"SendBy" : null,
"StateStr" : "等待付款",
"UserName" : "张",
"OrderTheme" : "",
"PurchaseDetails" : null,
"SubscribeDate" : "\/Date(1443456000000)\/",
"State" : 1000,
"SendTime" : null,
"Id" : "ff827120-dfd4-4e8b-9ed0-a52200a25659",
"Remark" : "11号单",
"SendByMobile" : null,
"UserId" : "94caca00-3234-48f2-bdba-a522009ffb42",
"SendRemark" : null,
"IsRemoveFromAPP" : false,
"DistributionId" : "f1500937-9cc8-4533-a049-a4eb000094cb"
}
*/

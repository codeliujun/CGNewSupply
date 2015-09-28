//
//  CGOrderCell.swift
//  CGSupply
//
//  Created by liujun on 15/9/28.
//  Copyright © 2015年 liujun. All rights reserved.
//

import UIKit

class CGOrderCell: CGBaseCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var orderNOLabel: UILabel!
    
    @IBOutlet weak var shopNameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    var dataInfo : NSDictionary!
    
    func layoutConteWithInfo(info : NSDictionary) {
        
        dataInfo = info
        orderNOLabel.text = "配送单号：" + (dataInfo["SubscribeNum"] as! String)
        
        if let str = dataInfo["SubscribeNum"] {
            orderNOLabel.text = "配送单号：" + (str as! String)
        }else {
            orderNOLabel.text = "订单状态：没有数据"
        }
        
        if let str = dataInfo["SendBy"] {
            if  str.isKindOfClass(NSNull.classForCoder()) {
                shopNameLabel.text = "配送门店：没有数据"
            }else {
                shopNameLabel.text = "订单状态：" + (str as! String)
            }
        }
        
        if let str = dataInfo["StateStr"] {
            if  str.isKindOfClass(NSNull.classForCoder()) {
                statusLabel.text = "订单状态：没有数据"
            }else {
                statusLabel.text = "订单状态：" + (str as! String)
            }
        }
        
        
        if let str = dataInfo["Receive_Address"] {
            if  str.isKindOfClass(NSNull.classForCoder()) {
                addressLabel.text = "配送地址：没有数据"
            }else {
                addressLabel.text = "配送地址：" + (str as! String)
            }
        }
        
        let price = dataInfo["Total"] as! Double
        let str = NSString(format: "￥%.2f",price)
        priceLabel.text = str as String
        timeLabel.text = self.getTimeStr()
        
        //  priceLabel.text = "￥" +
        
    }
    
    func getTimeStr() -> String {
        
        let time = dataInfo["SubscribeDate"] as! String
        
        let time1 = (time as NSString).substringWithRange(NSMakeRange(6, 10))
        
        print("===\(time) ====\(time1)")
        
        let timeInteravel = (time1 as NSString).doubleValue
        
        let date = NSDate(timeIntervalSince1970: timeInteravel)
        
        let df = NSDateFormatter()
        df.dateFormat = "YYYY-MM-dd"
        
        return df.stringFromDate(date)
    }
    
}

/*
"ShopJson" : null,
"PurchaseCategory" : null,
"Receive_Address" : "中山市小榄镇",
"Total" : 2014.8,
"ShopId" : "d121c5dd-8f30-4721-b2ad-a52100f69455",
"LeadInformation" : "\/123456789",
"SubscribeDateShow" : "2015\/09\/28",
"SubscribeNum" : "S201509285",
"SendBy" : null,
"StateStr" : "等待付款",
"UserName" : "五步E家",
"OrderTheme" : "",
"PurchaseDetails" : null,
"SubscribeDate" : "\/Date(1443369600000)\/",
"State" : 1000,
"SendTime" : null,
"Id" : "314566f3-5cb2-4047-8c38-a52100f77f79",
"Remark" : null,
"SendByMobile" : null,
"UserId" : "3ab7b62d-833e-4636-8b97-a52100f69455",
"SendRemark" : null,
"IsRemoveFromAPP" : false,
"DistributionId" : "f1500937-9cc8-4533-a049-a4eb000094cb"
*/
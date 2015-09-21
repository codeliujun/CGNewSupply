//
//  CGHTTPRequest.swift
//  CGSupply
//
//  Created by liujun on 15/9/21.
//  Copyright © 2015年 liujun. All rights reserved.
//

let kBaseUrl         =          "http://api.coolgou.com/api"

import UIKit

typealias  SuccessBlock     =   (result:NSDictionary!)->()
typealias  FailueBlock       =   (failue:NSDictionary!)->()

class CGHTTPRequest: NSObject {
    
    func request(url url:String,parameters:NSDictionary!,success:((result:NSDictionary!)->())!,failue:((failue:NSDictionary!)->())!) {
        
        SVProgressHUD.show()
        
        //判断网络是否连接
        let status = AFNetworkReachabilityManager.sharedManager().networkReachabilityStatus
        
        if  status == AFNetworkReachabilityStatus.NotReachable {
            SVProgressHUD.dismiss()
            SVProgressHUD.showErrorWithStatus("当前没有网络连接")
            return
        }
        
        //当有网络连接的时候
        let manager = AFHTTPRequestOperationManager()
        let baseUrl = kBaseUrl+"/"+url
        manager.responseSerializer = AFJSONResponseSerializer()
        
        manager.GET(baseUrl, parameters: parameters, success:
        { (operation:AFHTTPRequestOperation, responseObject:AnyObject) -> Void in
            let result = responseObject as! NSDictionary
            if  result["ErrorCode"] as! Int == 200 {
                if  success != nil  {
                    success(result:result)
                }
            }else {
                let str = result["Message"] as! String
                print("\(str)")
                if  failue != nil {
                    failue(failue:["failue":str])
                }
            }
        }){ (operation:AFHTTPRequestOperation, error:NSError) -> Void in
            if failue != nil   {
                failue(failue:["failue":"网络连接错误"])
            }
        }
}
    
    
    

    
}

//
//  CGCache.swift
//  CGSupply
//
//  Created by liujun on 15/9/21.
//  Copyright © 2015年 liujun. All rights reserved.
//

import UIKit

class CGCache: NSObject {

    
    class func getLoginInfoPath()->String {
        
        let home = NSHomeDirectory() as NSString
        let docPath = home.stringByAppendingPathComponent("Documents") as NSString
        let filePath = docPath.stringByAppendingPathComponent("userInfo.plist")
        
        return filePath
    }
    
    class func saveLoginInfo(info info:NSDictionary!) {
        if info.writeToFile(self.getLoginInfoPath(), atomically: true) == true {
            print("保存成功")
        }
    }
    
    class func getLoginInfo()->NSDictionary? {
        
        //可能为空
        let info = NSDictionary(contentsOfFile: self.getLoginInfoPath())
        
        return info
    }
    
}

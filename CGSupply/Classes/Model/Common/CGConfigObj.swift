//
//  CGConfigObj.swift
//  CGSupply
//
//  Created by liujun on 15/9/21.
//  Copyright © 2015年 liujun. All rights reserved.
//

import UIKit

class CGConfigObj: NSObject {

    var userObj : CGUserObj?
    
    //单利
    class func shareConfig()->CGConfigObj {
        
        struct CGSingleton {
            static var predicate:dispatch_once_t = 0
            static var instance:CGConfigObj? = nil
        }

        dispatch_once(&CGSingleton.predicate) { () -> Void in
            CGSingleton.instance = CGConfigObj()
        }
        
        return CGSingleton.instance!
   
    }
    
    
}

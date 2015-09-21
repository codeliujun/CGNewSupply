//
//  UIColorHexColor.swift
//  CGSupply
//
//  Created by liujun on 15/9/20.
//  Copyright © 2015年 liujun. All rights reserved.
//

import UIKit

let DEFAULT_COLOR  = UIColor.whiteColor()

extension UIColor {
    
    public class func HexColor(hexString:String?)->UIColor{
        
        let cString = hexString?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        
        if cString?.length() < 6 {
            return DEFAULT_COLOR
        }
        
        var newStr : NSString!
        
        if (cString?.hasPrefix("#") == true) {
            newStr = (cString! as NSString).substringFromIndex(1)
        }
        
        if cString?.length() != 7 {
            return DEFAULT_COLOR
        }
        
        var range = NSRange(location: 0, length: 2)
        range.location = 0
        range.length = 2
        let rStr = newStr.substringWithRange(range)
        
        range.location = 2
        let gStr = newStr.substringWithRange(range)
        
        range.location = 4
        let bStr = newStr.substringWithRange(range)
        
        let r = UnsafeMutablePointer<UInt32>.alloc(1)
        r.initialize(1)
        NSScanner(string: rStr).scanHexInt(r)
        
        let g = UnsafeMutablePointer<UInt32>.alloc(1)
        NSScanner(string: gStr).scanHexInt(g)
        
        let b = UnsafeMutablePointer<UInt32>.alloc(1)
        NSScanner(string: bStr).scanHexInt(b)
        
        print("\(r.memory) \(g.memory) \(b.memory)")
        return UIColor(red: CGFloat(Double(r.memory)/255.0), green: CGFloat(Double(g.memory)/255.0), blue:CGFloat(Double(b.memory)/255.0), alpha:CGFloat(1))
//        return UIColor.redColor()
    }
}





